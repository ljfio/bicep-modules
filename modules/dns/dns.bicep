import { privateDnsZoneKey as privateDnsZoneKeyData, privateDnsZoneMap, privateDnsZonesByType } from 'zones.bicep'

@description('Private Endpoint Private DNS zone keys supported by the dns library, re-exported from zones.bicep for consumers: naming-style resource type keys, with a `_<group>` suffix for resource types that require several zones (for example `storage_account_blob`); a single-zone type is its own key (`key_vault_vault`). See the generated zone catalogue for the full mapping.')
@export()
type privateDnsZoneKey = privateDnsZoneKeyData

@description('Returns the Private Endpoint Private DNS zone name Azure requires for a resource type group, for example `privateDnsZone(\'storage_account_blob\')` -> `privatelink.blob.core.windows.net`. Unknown zone keys are rejected at build time by the `privateDnsZoneKey` union type.')
@export()
func privateDnsZone(key privateDnsZoneKey) string =>
  privateDnsZoneMap[key]

@description('Returns every Private Endpoint Private DNS zone a resource type requires, for example `privateDnsZones(\'storage_account\')` -> the blob, dfs, file, queue and table zones. Accepts the naming-style resource type key; type keys outside the catalogue yield an empty array.')
@export()
func privateDnsZones(resourceType string) string[] =>
  privateDnsZonesByType[?resourceType] ?? []
