import * as regions from '../../modules/regions/regions.bicep'

// null is not a valid region; the string parameter must reject it at build
// time.
output paired string = regions.pairedRegion(null)
