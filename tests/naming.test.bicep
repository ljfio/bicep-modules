import * as naming from '../modules/naming/naming.bicep'

// Using-target for tests/naming.test.bicepparam: every parameter is a unit
// test assertion. The parameter file computes the values with the naming
// functions, and tests/naming.test.expected.json holds the expected results.
// The parameter types double as return-type assertions: an assignment whose
// type does not match fails the build.

param hyphenTypeName string
param compactTypeName string
param lowercaseTypeName string
param truncatedStorageName string
param truncatedKeyVaultName string
param forcedCompactName string
param regionFromCliName string
param regionFromDisplayName string
param unknownRegionName string
param abbreviation string
param maxLength int
param segmentArrayOrder string
param noLimitTypeName string
param noLimitMaxLength int
param contextTypeName string
param contextPartialName string
param contextComponentName string
param contextOrganizationName string
param contextNullExtrasName string
param contextSegments array

// Boundary smoke test: compiling this template proves the module's exported
// functions inline into an ordinary ARM template and compose in template
// expressions. The ARM engine's evaluation is trusted, not re-tested here.
output smokeResourceGroupName string = naming.resourceName('resource_group', ['contoso', 'demo', 'uksouth'])

// Reference every parameter so the target stays lint-clean.
output assignedValues object = {
  hyphenTypeName: hyphenTypeName
  compactTypeName: compactTypeName
  lowercaseTypeName: lowercaseTypeName
  truncatedStorageName: truncatedStorageName
  truncatedKeyVaultName: truncatedKeyVaultName
  forcedCompactName: forcedCompactName
  regionFromCliName: regionFromCliName
  regionFromDisplayName: regionFromDisplayName
  unknownRegionName: unknownRegionName
  abbreviation: abbreviation
  maxLength: maxLength
  segmentArrayOrder: segmentArrayOrder
  noLimitTypeName: noLimitTypeName
  noLimitMaxLength: noLimitMaxLength
  contextTypeName: contextTypeName
  contextPartialName: contextPartialName
  contextComponentName: contextComponentName
  contextOrganizationName: contextOrganizationName
  contextNullExtrasName: contextNullExtrasName
  contextSegments: contextSegments
}
