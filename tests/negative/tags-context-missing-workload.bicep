import * as tags from '../../modules/tags/tags.bicep'

// A context without the required workload key must be rejected at build time.
output tags object = tags.standardTags({ environment: 'prod', region: 'uksouth' })
