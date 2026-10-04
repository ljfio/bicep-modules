import * as tags from '../../modules/tags/tags.bicep'

// A misspelled context key must be rejected by the sealed tagContext type.
output tags object = tags.standardTags({ worklod: 'contoso' })
