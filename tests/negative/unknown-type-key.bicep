import * as naming from '../../modules/naming/naming.bicep'

// An unknown resource type key must be rejected by the resourceType union.
output name string = naming.resourceName('storage_acount', ['contoso'])
