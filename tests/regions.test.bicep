import * as regions from '../modules/regions/regions.bicep'

// Using-target for tests/regions.test.bicepparam: every parameter is a unit
// test assertion. The parameter file computes the values with the regions
// functions, and tests/regions.test.expected.json holds the expected results.
// The parameter types double as return-type assertions: an assignment whose
// type does not match fails the build.

param regionFromCliName string
param regionFromDisplayName string
param regionFromDashedName string
param unknownRegionCode string
param regionCodeParityWithNaming bool
param pairedKnownRegion string
param pairedFromDisplayName string
param pairedCrossContinentRegion string
param pairedNoPairRegion string
param unknownPairedRegion string
param geographyEurope string
param geographyNorthAmerica string
param geographyAsiaPacific string
param unknownGeography string

// Boundary smoke test: compiling this template proves the module's exported
// functions inline into an ordinary ARM template and compose in template
// expressions. The ARM engine's evaluation is trusted, not re-tested here.
output smokePairedRegion string = regions.pairedRegion('westeurope')

// Reference every parameter so the target stays lint-clean.
output assignedValues object = {
  regionFromCliName: regionFromCliName
  regionFromDisplayName: regionFromDisplayName
  regionFromDashedName: regionFromDashedName
  unknownRegionCode: unknownRegionCode
  regionCodeParityWithNaming: regionCodeParityWithNaming
  pairedKnownRegion: pairedKnownRegion
  pairedFromDisplayName: pairedFromDisplayName
  pairedCrossContinentRegion: pairedCrossContinentRegion
  pairedNoPairRegion: pairedNoPairRegion
  unknownPairedRegion: unknownPairedRegion
  geographyEurope: geographyEurope
  geographyNorthAmerica: geographyNorthAmerica
  geographyAsiaPacific: geographyAsiaPacific
  unknownGeography: unknownGeography
}
