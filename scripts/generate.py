#!/usr/bin/env python3
"""Regenerates modules/naming/naming.bicep and modules/naming/README.md from
upstream naming standards.

Sources:
- Microsoft Azure Verified Naming Utility resource-name-rules (per-type slug,
  length, hyphen and casing rules)
  https://github.com/Azure/terraform-azure-avm-utl-naming
- claranet/terraform-azurerm-regions (region abbreviation standard)
  https://github.com/claranet/terraform-azurerm-regions

Run from the repository root: python3 scripts/generate.py
"""
import json
import os
import re
import urllib.request

AVM_BASE = 'https://raw.githubusercontent.com/Azure/terraform-azure-avm-utl-naming/main/data/'
REGIONS_URL = 'https://raw.githubusercontent.com/claranet/terraform-azurerm-regions/master/regions.tf'

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODULE = os.path.join(REPO, 'modules', 'naming')

IDENT = re.compile(r'^[a-zA-Z_][a-zA-Z0-9_]*$')


def fetch(url):
    with urllib.request.urlopen(url) as r:
        return r.read().decode()


def bicep_key(k):
    return k if IDENT.match(k) else f"'{k}'"


def distill_rules():
    generated = json.loads(fetch(AVM_BASE + 'resource-name-rules.json'))['resources']
    manual = json.loads(fetch(AVM_BASE + 'resource-name-rules.manual.json')).get('resources') or {}
    resources = dict(generated)
    for k, v in manual.items():
        resources[k] = {**resources.get(k, {}), **v}
    out = {}
    for key, r in sorted(resources.items()):
        if not r.get('slug'):
            continue
        out[key] = {
            'slug': r['slug'],
            'resourceType': r.get('resource_type'),
            'max': r.get('max_length'),
            'dashes': bool(r.get('dashes')),
            'lowercase': bool(r.get('lowercase')),
        }
    return out


def parse_locals(tf):
    """Parse HCL locals blocks of the form `  name = { key = "value" ... }`."""
    blocks = {}
    for m in re.finditer(r'^  (\w+) = \{\n(.*?)^  \}', tf, re.M | re.S):
        body = m.group(2)
        entries = re.findall(r'^\s*"?\(?([\w -]+?)\)?"?\s*=\s*"([^"]*)"\s*(?:#.*)?$', body, re.M)
        blocks[m.group(1)] = {k.strip(): v for k, v in entries}
    return blocks


def load_regions():
    blocks = parse_locals(fetch(REGIONS_URL))
    regions, short, cli = blocks['regions'], blocks['short_names'], blocks['cli_names']
    paired = blocks.get('paired', {})
    codes = {}
    rows = []
    for slug, display in regions.items():
        if slug not in short or slug not in cli or cli[slug] == slug:
            continue  # skip continental aggregates, keep real regions only
        s = short[slug]
        codes[cli[slug].lower()] = s
        codes[slug] = s
        codes[re.sub(r'\s+', '-', display.lower())] = s
        p = paired.get(slug)
        rows.append((display, cli[slug], s, short.get(p, p) if p else ''))
    return codes, rows


def emit_bicep(rules, region_codes):
    keys = sorted(rules)
    lines = [
        "@description('Resource type identifiers supported by the naming library. Keys follow the Azure Verified Naming Utility resource catalog (https://github.com/Azure/terraform-azure-avm-utl-naming); abbreviations follow the Cloud Adoption Framework recommendations (https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations) as catalogued by the Azure Periodic Table (azureperiodictable.com); length, separator and case rules follow the Azure resource naming rules (https://learn.microsoft.com/azure/azure-resource-manager/management/resource-name-rules).')",
    ]
    lines += ['@export()', 'type resourceType = ' + f"'{keys[0]}'"]
    for k in keys[1:]:
        lines.append(f"  | '{k}'")
    lines += [
        '',
        "@description('Naming rules per resource type: `slug` is the Cloud Adoption Framework abbreviation, `max` the maximum allowed name length, `dashes` whether hyphens are allowed in the name, `lowercase` whether the name must be lower case. Rules sourced from the Azure Verified Naming Utility catalog (https://github.com/Azure/terraform-azure-avm-utl-naming) and the Azure resource naming rules (https://learn.microsoft.com/azure/azure-resource-manager/management/resource-name-rules).')",
        'var nameRules = {',
    ]
    for k in keys:
        r = rules[k]
        lines += [
            f'  {bicep_key(k)}: {{',
            f"    slug: '{r['slug']}'",
        ]
        if r['max'] is not None:
            lines.append(f"    max: {r['max']}")
        lines += [
            f'    dashes: {str(r["dashes"]).lower()}',
            f'    lowercase: {str(r["lowercase"]).lower()}',
            '  }',
        ]
    lines += [
        '}',
        '',
        "@description('Azure region abbreviations following the claranet region naming standard (https://github.com/claranet/terraform-azurerm-regions). Lookup keys accept the AZ CLI name (`uksouth`), the dashed form (`uk-south`) and the display name (`UK South`), all case insensitive; values are the short notation used as the region segment of resource names.')",
        'var regionCodes = {',
    ]
    for k in sorted(region_codes):
        lines.append(f"  {bicep_key(k)}: '{region_codes[k]}'")
    lines += ['}', '\n\n',
        "@description('Naming context for `segmentsFrom` and `resourceNameFrom`: define the core segments once (for example workload, environment, region) and pass the same object down to nested modules. All properties are optional; `region` accepts any Azure region form (`uksouth`, `uk-south`, `UK South`) and is abbreviated when names are composed. The type is sealed: unknown keys are rejected so context typos fail at build time; use the `extraSegments` parameter for additional segments.')",
        '@sealed()',
        '@export()',
        'type namingContext = {',
        "@description('Organization segment. Omit unless disambiguating globally-scoped names in estates where multiple organizations share a tenant.')",
        '  organization: string?',
        '',
        "@description('Workload, application, or project segment - the primary naming component per the Cloud Adoption Framework.')",
        '  workload: string?',
        '',
        "@description('Environment segment, for example `prod`, `dev`, `demo`.')",
        '  environment: string?',
        '',
        "@description('Region segment; accepts any Azure region form and is abbreviated to the short notation.')",
        '  region: string?',
        '',
        "@description('Component segment, for the resource role within the workload (for example `shared`, `api`).')",
        '  component: string?',
        '}',
        '\n\n',

        "@description('Resolves an Azure region to its short abbreviation. Accepts the AZ CLI name (`westeurope`), the dashed form (`west-europe`/`eu-west`) or the display name (`West Europe`), case insensitive. Anything that is not a known region passes through unchanged.')",
        '@export()',
        'func regionCode(region string) string =>',
        "  regionCodes[toLower(replace(region, ' ', '-'))] ?? region",
        '',
        "@description('Returns the Cloud Adoption Framework abbreviation for a resource type (for example `resource_group` -> `rg`).')",
        '@export()',
        'func resourceAbbreviation(type resourceType) string =>',
        '  nameRules[type].slug',
        '',
        "@description('Returns the maximum name length allowed for the resource type, or 255 when no limit is documented.')",
        '@export()',
        'func resourceNameMaxLength(type resourceType) int =>',
        '  nameRules[type].max ?? 255',
        '',
        "@description('Trims the naming segments, resolves any segment naming an Azure region to its abbreviation, and drops empty segments.')",
        'func normalizeSegments(segments string[]) string[] =>',
        "  filter(map(segments, (segment) => regionCode(trim(segment))), (segment) => segment != '')",
        '',
        "@description('Joins the type abbreviation and the naming segments with the separator the resource type allows (hyphens, or nothing when the type forbids them).')",
        'func rawName(type resourceType, segments string[]) string =>',
        "  join(concat([nameRules[type].slug], normalizeSegments(segments)), nameRules[type].dashes ? '-' : '')",
        '',
        "@description('Applies the casing the resource type requires (lower case when the type disallows upper case).')",
        'func applyCase(type resourceType, name string) string =>',
        '  nameRules[type].lowercase ? toLower(name) : name',
        '',
        "@description('Truncates the name to the maximum length allowed for the resource type when it would exceed the limit.')",
        'func applyLengthLimit(type resourceType, name string) string =>',
        '  take(name, nameRules[type].max ?? 255)',
        '',
        "@description('Composes a resource name that complies with the rules of the resource type: the type abbreviation followed by the naming segments (typically workload, environment, region, component, in any number), hyphen delimited when the type allows hyphens, lower cased when the type requires it, and truncated to the type name limit when needed. Any segment naming an Azure region (`uksouth`, `UK South`) is abbreviated to its short form (`uks`). Pass only the segments you need; empty segments are dropped.')",
        '@export()',
        'func resourceName(type resourceType, segments string[]) string =>',
        '  applyLengthLimit(type, applyCase(type, rawName(type, segments)))',
        '',
        "@description('As `resourceName`, but with hyphens removed from the composed name, for resource types that disallow them in names (storage accounts) or for conventions that prefer compact names. The caller is responsible for keeping the combined length within the resource type limit; the name is truncated to the type limit when it exceeds it.')",
        '@export()',
        'func compactResourceName(type resourceType, segments string[]) string =>',
        "  applyLengthLimit(type, applyCase(type, replace(rawName(type, segments), '-', '')))",
        '',
        "@description('Converts a naming context object into ordered naming segments, for defining the core segments once (for example workload, environment, region) and passing them down to nested modules. Context keys, all optional and in this order: `organization`, `workload`, `environment`, `region`, `component`. The `region` key accepts any Azure region form (`uksouth`, `uk-south`, `UK South`) and is abbreviated; missing or empty keys are dropped.')",
        '@export()',
        'func segmentsFrom(context namingContext) string[] =>',
        '  filter([',
        "    trim(context.?organization ?? '')",
        "    trim(context.?workload ?? '')",
        "    trim(context.?environment ?? '')",
        "    regionCode(trim(context.?region ?? ''))",
        "    trim(context.?component ?? '')",
        "  ], (segment) => segment != '')",
        '',
        "@description('Composes a compliant resource name from a naming context object plus any extra segments appended after the context segments (typically the component for that resource). `context` uses the keys of `segmentsFrom` (`organization`, `workload`, `environment`, `region`, `component`, all optional); `extraSegments` may be empty. Define the context once at the top level and pass it to nested modules, which then name their resources without repeating the core segments.')",
        '@export()',
        'func resourceNameFrom(type resourceType, context namingContext, extraSegments string[]) string =>',
        '  resourceName(type, concat(segmentsFrom(context), extraSegments))',
        '',
        '',
    ]
    return '\n'.join(lines) + '\n'


def emit_readme(rules, region_rows):
    keys = sorted(rules)
    type_rows = '\n'.join(
        f"| `{k}` | {rules[k]['resourceType'] or ''} | `{rules[k]['slug']}` | "
        f"{rules[k]['max'] if rules[k]['max'] is not None else '&mdash;'} | "
        f"{'yes' if rules[k]['dashes'] else 'no'} | {'yes' if rules[k]['lowercase'] else 'no'} |"
        for k in keys)
    region_table = '\n'.join(
        f'| {display} | `{cli}` | `{short}` | {paired} |' for display, cli, short, paired in region_rows)

    return f'''# naming

Bicep function library that composes Azure resource names which comply with the
naming rules of each resource type.

- Type abbreviations come from the
  [Cloud Adoption Framework recommendations](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations).
- Per-type rules (length, hyphens, casing) come from the
  [Azure resource naming rules](https://learn.microsoft.com/azure/azure-resource-manager/management/resource-name-rules)
  via the [Azure Verified Naming Utility](https://github.com/Azure/terraform-azure-avm-utl-naming)
  catalog, cross-checked against the [Azure Periodic Table](https://www.azureperiodictable.com/)
  and [AZNames-bicep](https://github.com/francesco-sodano/AZNames-bicep).
- Region abbreviations follow the
  [claranet region naming standard](https://github.com/claranet/terraform-azurerm-regions).

## Usage

```bicep
import * as naming from 'br/ljfio:naming:0.1.0'

var segments = ['contoso', 'demo', 'uksouth', 'shared']

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {{
  name: naming.resourceName('storage_account', segments)
  // -> stcontosodemouksshared (compact + lowercase: storage forbids hyphens)
}}

resource webApp 'Microsoft.Web/sites@2023-12-01' = {{
  name: naming.resourceName('site_web_app', segments)
  // -> app-contoso-demo-uks-shared (hyphens allowed, case preserved)
}}
```

Every function takes an **array of segments** in your convention's order
(workload, environment, region, component, whatever you use). Segments are
trimmed, empty segments dropped, and any segment that names an Azure region is
abbreviated automatically (`uksouth` or `UK South` -> `uks`). The type
abbreviation is prepended automatically.

## Which segments should you use?

Follow the Cloud Adoption Framework
[naming components](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming):
`type - workload/application/project - environment - region - instance`. The
workload is the primary segment; it is what the resource belongs to.

Resist putting an organization hierarchy (organization, team, OU-like
structures) into resource names:

- **Names are permanent.** Most Azure resource names can't be changed after
  creation, and CAF's first rule is to include only information that remains
  constant. Teams and org structures reorganize; workloads don't.
- **The hierarchy is carried by scope.** Management groups and subscriptions
  model your organization; the resource group and subscription a resource sits
  in already identify the owning org and team. CAF only uses the organization
  in subscription-level names (for example `<org>-<workload>-<env>`).
- **Names have hard length limits.** Storage accounts allow 24 characters;
  every segment burns budget that the workload needs.

Capture team and other mutable ownership details in **resource tags** instead.
Keep the optional `organization` context key for its narrow legitimate use:
disambiguating globally-scoped names (storage accounts, web apps) in estates
where multiple organizations share an Azure Active Directory tenant.

## Naming context for nested modules

Define the core segments once as a context object and pass it down to nested
modules; each module then names its resources without repeating the core
segments.

```bicep
// main.bicep
param workload string = 'contoso'
param environment string = 'demo'
param location string = 'uksouth'

var namingContext = {{
  workload: workload
  environment: environment
  region: location
}}

module api 'modules/api.bicep' = {{
  name: naming.resourceNameFrom('resource_group', namingContext, ['api'])
  params: {{
    namingContext: namingContext
  }}
}}
```

```bicep
// modules/api.bicep
import * as naming from 'br/ljfio:naming:0.1.0'

param namingContext naming.namingContext

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {{
  name: naming.resourceNameFrom('storage_account', namingContext, ['shared'])
  // -> stcontosodemouksshared
}}
```

Context keys, in order and all optional: `organization`, `workload`,
`environment`, `region`, `component`. The context type is sealed, so typos
fail at build time; pass additional segments via `extraSegments`.
`segmentsFrom(context)` returns the ordered segment array when you need it
directly.

## Exported types

| Type | Description |
|---|---|
| `resourceType` | Union of all supported resource type keys (the first parameter of every naming function). |
| `namingContext` | Sealed, all-optional object type with the `organization`, `workload`, `environment`, `region`, `component` keys; type your nested module parameters with it. |

## Functions

| Function | Description |
|---|---|
| `resourceName(type, segments string[])` | Compliant name for the type: hyphens when allowed, compact when not, lower case when required, truncated to the type's maximum length. |
| `compactResourceName(type, segments string[])` | Same, but always compact (hyphens stripped). |
| `resourceNameFrom(type, context namingContext, extraSegments string[])` | As `resourceName`, building the leading segments from a naming context object; `extraSegments` (may be empty) are appended after the context segments. |
| `segmentsFrom(context namingContext)` | Ordered segments for a naming context object (`organization`, `workload`, `environment`, `region`, `component`, all optional; region abbreviated). |
| `resourceAbbreviation(type)` | The Cloud Adoption Framework abbreviation for the type (`resource_group` -> `rg`). |
| `regionCode(region)` | Short abbreviation for an Azure region (`westeurope`/`West Europe` -> `euw`); unknown values pass through unchanged. |
| `resourceNameMaxLength(type)` | Maximum name length allowed for the type (255 when undocumented). |

## Why not `naming.resource.storageAccount(...)`?

Bicep user-defined functions cannot be grouped into nested namespaces, so
`naming.resource.storageAccount(...)` is not expressible. Generating one
exported function per resource type is also not viable: Bicep inlines every
exported function into each consuming template (a consumer using 2 of 300
exported functions receives all 301), so 579 per-type wrappers would far exceed
ARM's per-template function limits and bloat every deployment. Use
`resourceName('<type key>', segments)` with the type key table below instead.

## Compliance behaviour

- Types that forbid hyphens (storage accounts, Analysis Services, ...) are
  joined without a separator automatically; types that allow them are joined
  with `-`.
- Types that require lower case (storage accounts, ...) are lower cased
  automatically.
- Names longer than the type's documented maximum are truncated from the end.
  Keep segments short; truncation is deterministic but can make two long names
  collide.

## Region abbreviations

| Region | AZ CLI name | Abbreviation | Paired region |
|---|---|---|---|
{region_table}

## Supported resource types

| Type key | ARM resource type | Abbreviation | Max length | Hyphens | Lower case |
|---|---|---|---|---|---|
{type_rows}
'''


def main():
    rules = distill_rules()
    region_codes, region_rows = load_regions()
    print(f'{len(rules)} resource types, {len(region_codes)} region lookup keys, {len(region_rows)} regions')
    with open(os.path.join(MODULE, 'naming.bicep'), 'w') as f:
        f.write(emit_bicep(rules, region_codes))
    with open(os.path.join(MODULE, 'README.md'), 'w') as f:
        f.write(emit_readme(rules, region_rows))
    print('emitted modules/naming/naming.bicep and modules/naming/README.md')


if __name__ == '__main__':
    main()
