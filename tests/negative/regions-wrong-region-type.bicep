import * as regions from '../../modules/regions/regions.bicep'

// Region arguments are free-form strings; a non-string must be rejected by
// the function signature at build time.
output code string = regions.regionCode(123)
