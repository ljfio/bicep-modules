import * as dns from '../modules/dns/dns.bicep'

// Using-target for tests/dns.test.bicepparam: every parameter is a unit
// test assertion. The parameter file computes the values with the dns
// functions, and tests/dns.test.expected.json holds the expected results.
// The parameter types double as return-type assertions: an assignment whose
// type does not match fails the build.

param storageBlobZone string
param storageFileZone string
param keyVaultZone string
param sqlServerZone string
param postgresqlZone string
param mysqlZone string
param eventHubsZone string
param serviceBusZone string
param containerRegistryZone string
param cosmosDbZone string
param cosmosMongoZone string
param webAppZone string
param slotZone string
param redisZone string
param dataFactoryZone string
param storageZones array
param storageZoneCount int
param keyVaultZones array
param unknownTypeZones array

// Boundary smoke test: compiling this template proves the module's exported
// functions inline into an ordinary ARM template and compose in template
// expressions. The ARM engine's evaluation is trusted, not re-tested here.
output smokeStorageBlobZone string = dns.privateDnsZone('storage_account_blob')

// Reference every parameter so the target stays lint-clean.
output assignedValues object = {
  storageBlobZone: storageBlobZone
  storageFileZone: storageFileZone
  keyVaultZone: keyVaultZone
  sqlServerZone: sqlServerZone
  postgresqlZone: postgresqlZone
  mysqlZone: mysqlZone
  eventHubsZone: eventHubsZone
  serviceBusZone: serviceBusZone
  containerRegistryZone: containerRegistryZone
  cosmosDbZone: cosmosDbZone
  cosmosMongoZone: cosmosMongoZone
  webAppZone: webAppZone
  slotZone: slotZone
  redisZone: redisZone
  dataFactoryZone: dataFactoryZone
  storageZones: storageZones
  storageZoneCount: storageZoneCount
  keyVaultZones: keyVaultZones
  unknownTypeZones: unknownTypeZones
}
