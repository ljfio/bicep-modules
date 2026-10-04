import * as ids from '../modules/ids/ids.bicep'

// Using-target for tests/ids.test.bicepparam: every parameter is a unit
// test assertion. The parameter file computes the values with the ids
// functions, and tests/ids.test.expected.json holds the expected results.
// The parameter types double as return-type assertions: an assignment whose
// type does not match fails the build. The pure functions (providerType,
// armResourceIdIn) are evaluated by bicep build-params; the deployment-context
// armResourceId cannot be, so it is covered by the boundary smoke output below.

param storageProviderType string
param keyVaultProviderType string
param webAppProviderType string
param managedClusterProviderType string
param functionAppProviderType string
param storageAccountId string
param keyVaultAccountId string
param webAppAccountId string
param managedClusterAccountId string
param logAnalyticsAccountId string

// Boundary smoke test: compiling this template proves the module's exported
// functions inline into an ordinary ARM template and compose in template
// expressions, including the deployment-context armResourceId.
output smokeStorageId string = ids.armResourceId('storage_account', 'stcontosodemouksshared')

// Reference every parameter so the target stays lint-clean.
output assignedValues object = {
  storageProviderType: storageProviderType
  keyVaultProviderType: keyVaultProviderType
  webAppProviderType: webAppProviderType
  managedClusterProviderType: managedClusterProviderType
  functionAppProviderType: functionAppProviderType
  storageAccountId: storageAccountId
  keyVaultAccountId: keyVaultAccountId
  webAppAccountId: webAppAccountId
  managedClusterAccountId: managedClusterAccountId
  logAnalyticsAccountId: logAnalyticsAccountId
}
