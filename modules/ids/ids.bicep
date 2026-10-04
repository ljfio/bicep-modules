import { idType as idTypeData, providerTypes } from 'types.bicep'

@description('Resource type identifiers supported by the ids library; re-exported from types.bicep for consumers. Keys follow the naming module type keys, so the same key that names a resource with the naming functions identifies it with the ids functions. See the generated module README for the full catalogue.')
@export()
type idType = idTypeData

@description('Returns the ARM resource provider type for a supported type key (for example `storage_account` -> `Microsoft.Storage/storageAccounts`). Provider type strings are verified against the Microsoft Learn ARM reference by the generator.')
@export()
func providerType(type idType) string =>
  providerTypes[type]

@description('Builds the fully qualified ARM resource ID of a resource in the current subscription and resource group, the scope the template deploys to: `/subscriptions/<current subscription>/resourceGroups/<current resource group>/providers/<type>/<name>`. Semantics are exactly the `resourceId` ARM function (which this delegates to), including validation of the provider type and name at deployment time. Being a deployment-context function, `armResourceId` cannot be used from `.bicepparam` files; use `armResourceIdIn` with explicit scope values there.')
@export()
func armResourceId(type idType, name string) string =>
  resourceId(providerType(type), name)

@description('Builds the fully qualified ARM resource ID of a resource in an explicit subscription and resource group: `/subscriptions/<subscriptionId>/resourceGroups/<resourceGroup>/providers/<type>/<name>`. Composed with `format` string interpolation rather than `resourceId`, because ARM user-defined functions that depend on deployment-context functions such as `resourceId` cannot be evaluated while building `.bicepparam` files; this function is pure and safe to use from both templates and parameter files.')
@export()
func armResourceIdIn(subscriptionId string, resourceGroup string, type idType, name string) string =>
  format('/subscriptions/${subscriptionId}/resourceGroups/${resourceGroup}/providers/${providerType(type)}/${name}')
