import { resourceType as resourceTypeRules, nameRules } from 'rules.bicep'
import { regionCodes } from '../regions/regions-data.bicep'

@description('Resource type identifiers supported by the naming library; re-exported from rules.bicep for consumers. See the generated module README for the full catalogue and the naming rules per type.')
@export()
type resourceType = resourceTypeRules

@description('Naming context for `segmentsFrom` and `resourceNameFrom`: define the core segments once (for example workload, environment, region) and pass the same object down to nested modules. `workload` is required - it is the primary naming component per the Cloud Adoption Framework; all other keys are optional. `region` accepts any Azure region form (`uksouth`, `uk-south`, `UK South`) and is abbreviated when names are composed. The type is sealed: unknown keys are rejected so context typos fail at build time; use the `extraSegments` parameter for additional segments.')
@sealed()
@export()
type namingContext = {
  @description('Organization segment. Omit unless disambiguating globally-scoped names in estates where multiple organizations share a tenant.')
  organization: string?

  @description('Workload, application, or project segment - the primary naming component per the Cloud Adoption Framework. Required: a context without a workload produces vague, collision-prone names.')
  workload: string

  @description('Environment segment, for example `prod`, `dev`, `demo`.')
  environment: string?

  @description('Region segment; accepts any Azure region form and is abbreviated to the short notation.')
  region: string?

  @description('Component segment, for the resource role within the workload (for example `shared`, `api`). Usually supplied per resource via the `extraSegments` parameter instead.')
  component: string?
}

@description('Resolves an Azure region to its short abbreviation. Accepts the AZ CLI name (`westeurope`), the dashed form (`west-europe`/`eu-west`) or the display name (`West Europe`), case insensitive. Anything that is not a known region passes through unchanged. Kept for compatibility; the canonical home of the region lookup is the regions module (`br/ljfio:regions`), which also exports paired-region and geography lookups.')
@export()
func regionCode(region string) string =>
  regionCodes[?toLower(replace(region, ' ', '-'))] ?? region

@description('Returns the Cloud Adoption Framework abbreviation for a resource type (for example `resource_group` -> `rg`).')
@export()
func resourceAbbreviation(type resourceType) string =>
  nameRules[type].slug

@description('Returns the maximum name length allowed for the resource type, or 255 when no limit is documented.')
@export()
func resourceNameMaxLength(type resourceType) int =>
  nameRules[type].?max ?? 255

@description('Trims the naming segments, resolves any segment naming an Azure region to its abbreviation, and drops empty segments.')
func normalizeSegments(segments string[]) string[] =>
  filter(map(segments, (segment) => regionCode(trim(segment))), (segment) => segment != '')

@description('Joins the type abbreviation and the naming segments with the separator the resource type allows (hyphens, or nothing when the type forbids them).')
func rawName(type resourceType, segments string[]) string =>
  join(concat([nameRules[type].slug], normalizeSegments(segments)), nameRules[type].dashes ? '-' : '')

@description('Applies the casing the resource type requires (lower case when the type disallows upper case).')
func applyCase(type resourceType, name string) string =>
  nameRules[type].lowercase ? toLower(name) : name

@description('Truncates the name to the maximum length allowed for the resource type when it would exceed the limit.')
func applyLengthLimit(type resourceType, name string) string =>
  take(name, nameRules[type].?max ?? 255)

@description('Composes a resource name that complies with the rules of the resource type: the type abbreviation followed by the naming segments (typically workload, environment, region, component, in any number), hyphen delimited when the type allows hyphens, lower cased when the type requires it, and truncated to the type name limit when needed. Any segment naming an Azure region (`uksouth`, `UK South`) is abbreviated to its short form (`uks`). Pass only the segments you need; empty segments are dropped.')
@export()
func resourceName(type resourceType, segments string[]) string =>
  applyLengthLimit(type, applyCase(type, rawName(type, segments)))

@description('As `resourceName`, but with hyphens removed from the composed name, for resource types that disallow them in names (storage accounts) or for conventions that prefer compact names. The caller is responsible for keeping the combined length within the resource type limit; the name is truncated to the type limit when it exceeds it.')
@export()
func compactResourceName(type resourceType, segments string[]) string =>
  applyLengthLimit(type, applyCase(type, replace(rawName(type, segments), '-', '')))

@description('Converts a naming context object into ordered naming segments, for defining the core segments once (for example workload, environment, region) and passing them down to nested modules. Context keys, in this order: `organization`, `workload` (required), `environment`, `region`, `component`. The `region` key accepts any Azure region form (`uksouth`, `uk-south`, `UK South`) and is abbreviated; missing or empty keys are dropped.')
@export()
func segmentsFrom(context namingContext) string[] =>
  filter([
    trim(context.?organization ?? '')
    trim(context.workload)
    trim(context.?environment ?? '')
    regionCode(trim(context.?region ?? ''))
    trim(context.?component ?? '')
  ], (segment) => segment != '')

@description('Composes a compliant resource name from a naming context object plus any extra segments appended after the context segments (typically the component for that resource). `context` uses the keys of `segmentsFrom` (`organization`, `workload`, `environment`, `region`, `component`, with `workload` required and the rest optional); `extraSegments` may be null or empty. Define the context once at the top level and pass it to nested modules, which then name their resources without repeating the core segments.')
@export()
func resourceNameFrom(type resourceType, context namingContext, extraSegments string[]?) string =>
  resourceName(type, concat(segmentsFrom(context), extraSegments ?? []))
