import * as naming from '../../modules/naming/naming.bicep'

// A misspelled context key must be rejected by the sealed namingContext type.
output context array = naming.segmentsFrom({ worklod: 'contoso' })
