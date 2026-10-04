import * as naming from '../../modules/naming/naming.bicep'

// A misspelled override key must be rejected by the sealed namingContextOverride type.
output merged object = naming.mergeContext({ workload: 'contoso' }, { enviroment: 'demo' })
