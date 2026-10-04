import * as ids from '../../modules/ids/ids.bicep'

// An unknown resource type key must be rejected by the idType union.
output id string = ids.armResourceIdIn('11111111-1111-1111-1111-111111111111', 'rg-contoso', 'storage_acount', 'stcontoso')
