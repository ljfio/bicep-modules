# bicep-modules

Custom Bicep module library, published to GitHub Container Registry as OCI
artifacts and consumed with Bicep module aliases.

| Module | Path | Description |
|---|---|---|
| [naming](modules/naming/README.md) | `br:ghcr.io/ljfio/bicep-modules/naming:<version>` | Resource name functions compliant with each resource type's naming rules |

## Modules

### naming

Composes Azure resource names from an array of naming segments
(workload, environment, region, component, ...), enforcing per-resource-type
rules automatically: hyphens vs compact join, lower case, and maximum name
length. Type abbreviations follow the Cloud Adoption Framework; region
abbreviations cover every Azure region. See the
[module README](modules/naming/README.md) for the full API and catalogue.

## Publishing

Modules are published by [`.github/workflows/publish.yml`](.github/workflows/publish.yml):

1. Validation job lints the module, builds the test template and asserts the
   generated names (`tests/verify.py`).
2. Publishing to `ghcr.io/<owner>/bicep-modules/naming:<version>` runs on git
   tags (`v1.0.0` publishes version `1.0.0`) or via `workflow_dispatch`.

The first publish creates a private ghcr.io package. For anonymous pulls from
other machines and CI, change the package visibility to public once:
GitHub -> Packages -> bicep-modules -> Package settings -> Change visibility.

Versioning: bump the patch/minor for new resource types and regions, major for
breaking changes to the exported function signatures.

## Consuming

Add a `bicepconfig.json` next to the consuming Bicep files (`ociEnabled` is
required for non-Azure registries such as ghcr.io):

```json
{
  "experimentalFeaturesEnabled": {
    "ociEnabled": true
  },
  "moduleAliases": {
    "br": {
      "ljfio": {
        "registry": "ghcr.io",
        "modulePath": "ljfio/bicep-modules"
      }
    }
  }
}
```

Then import the naming functions:

```bicep
import * as naming from 'br/ljfio:naming:0.3.0'

var segments = ['contoso', 'demo', 'uksouth', 'shared']

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: naming.resourceName('resource_group', segments) // rg-contoso-demo-uks-shared
  location: 'uksouth'
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: naming.resourceName('storage_account', segments) // stcontosodemouksshared
  location: 'uksouth'
  kind: 'StorageV2'
  sku: { name: 'Standard_LRS' }
}
```

Verify a consumer:

```bash
az bicep restore --file infra/main.bicep
az bicep build --file infra/main.bicep --stdout > /dev/null
```

### Naming context for nested modules

Define the core segments once as a context object and pass it down; nested
modules name their resources with `resourceNameFrom` without repeating the
core segments:

```bicep
// main.bicep
var namingContext = { workload: workload, environment: environment, region: location }

module api 'modules/api.bicep' = {
  name: naming.resourceNameFrom('resource_group', namingContext, ['api'])
  params: {
    namingContext: namingContext
  }
}
```

```bicep
// modules/api.bicep
import * as naming from 'br/ljfio:naming:0.3.0'

param namingContext naming.namingContext

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: naming.resourceNameFrom('storage_account', namingContext, ['shared'])
  // -> stcontosodemouksshared
}
```

Context keys, in order and all optional: `organization`, `workload`,
`environment`, `region`, `component`. Keep resource names workload-centric —
the Cloud Adoption Framework puts organization and team structure in management
groups, subscriptions, and tags rather than in resource names. `mergeContext`
derives context variants from a base without repeating keys; see the
[module README](modules/naming/README.md) for the full rationale and API.

## Layout

```
bicep-modules/
├── modules/
│   └── naming/
│       ├── naming.bicep        (hand-written: naming functions and namingContext type)
│       ├── rules.bicep         (generated: resource type keys and per-type rules)
│       ├── regions.bicep       (generated: Azure region abbreviations)
│       ├── README.md           (hand-written: API and usage docs)
│       ├── resource-types.md   (generated: resource type catalogue)
│       └── regions.md          (generated: region abbreviation catalogue)
├── scripts/
│   └── generate.py             (regenerates the generated files above)
├── tests/
│   ├── naming.test.bicep       (using-target for the unit tests; boundary smoke template)
│   ├── naming.test.bicepparam  (unit tests: one naming assertion per parameter)
│   ├── naming.test.expected.json (golden results the assertions must produce)
│   ├── compare.py              (diffs compiled parameters against the golden file)
│   ├── negative.py             (runs the negative compile tests)
│   └── negative/               (invalid inputs that must fail to build)
├── bicepconfig.json
└── .github/workflows/publish.yml
```

`naming.bicep` imports the generated data files and re-exports the combined
surface; publishing compiles the three files into a single self-contained
artifact. CI regenerates the generated files and fails on drift.

## Testing

The Bicep-to-ARM boundary is trusted and only smoke-tested: the test template
imports the module and compiles to ARM. Naming behavior is unit-tested instead:

- `naming.test.bicepparam` computes every assertion with the naming functions;
  `bicep build-params` evaluates them with the Bicep engine itself (the same
  expression semantics as the ARM runtime), and `compare.py` diffs the
  compiled parameters against the golden file. Parameter types in the
  using-target double as return-type assertions.
- `tests/negative/` holds inputs that must fail to build (context typos,
  missing workload, unknown type keys), driven by `negative.py` and a manifest.

This caught real bugs an expression-mock evaluator had masked: ARM errors on
missing object keys even inside `coalesce`, so lookups now use safe access
(`[?...]`, `.?`) where keys may be absent.
