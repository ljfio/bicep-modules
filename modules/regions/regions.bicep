import { regionCodes } from 'regions-data.bicep'
import { regionPairs, regionGeographies } from 'regions-info.bicep'

@description('Resolves an Azure region to its short abbreviation. Accepts the AZ CLI name (`westeurope`), the dashed form (`west-europe`/`eu-west`) or the display name (`West Europe`), case insensitive. Anything that is not a known region passes through unchanged. This is the canonical home of the region lookup; the naming module imports the same generated data and re-exports the function for compatibility.')
@export()
func regionCode(region string) string =>
  regionCodes[?toLower(replace(region, ' ', '-'))] ?? region

@description('Returns the AZ CLI name of the Azure paired region (for example `uksouth` -> `ukwest`), or an empty string for regions without a pair and for anything that is not a known region. Accepts any Azure region form, like `regionCode`. The pairing is curated by hand - see the module README for sources and coverage.')
@export()
func pairedRegion(region string) string =>
  regionPairs[?regionCode(region)] ?? ''

@description('Returns the Azure geography the region belongs to, per the Azure region metadata taxonomy (for example `westeurope` -> `Europe`), or an empty string for anything that is not a known region. Accepts any Azure region form, like `regionCode`. The geography assignment is curated by hand - see the module README for sources and coverage.')
@export()
func geography(region string) string =>
  regionGeographies[?regionCode(region)] ?? ''
