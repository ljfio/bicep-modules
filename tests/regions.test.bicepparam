using './regions.test.bicep'

import * as regions from '../modules/regions/regions.bicep'
import * as naming from '../modules/naming/naming.bicep'

// Unit tests. bicep build-params evaluates these expressions with the Bicep
// engine itself, so the compiled parameters are the actual function results;
// tests/compare.py diffs them against tests/regions.test.expected.json.

param regionFromCliName = regions.regionCode('westeurope')
param regionFromDisplayName = regions.regionCode('West Europe')
param regionFromDashedName = regions.regionCode('uk-south')
param unknownRegionCode = regions.regionCode('notaregion')
param regionCodeParityWithNaming = regions.regionCode('westeurope') == naming.regionCode('westeurope') && regions.regionCode('UK South') == naming.regionCode('UK South') && regions.regionCode('notaregion') == naming.regionCode('notaregion')
param pairedKnownRegion = regions.pairedRegion('uksouth')
param pairedFromDisplayName = regions.pairedRegion('UK South')
param pairedCrossContinentRegion = regions.pairedRegion('brazilsouth')
param pairedNoPairRegion = regions.pairedRegion('italynorth')
param unknownPairedRegion = regions.pairedRegion('notaregion')
param geographyEurope = regions.geography('uksouth')
param geographyNorthAmerica = regions.geography('eastus')
param geographyAsiaPacific = regions.geography('japaneast')
param unknownGeography = regions.geography('notaregion')
