import * as naming from '../../modules/naming/naming.bicep'

// A context without the required workload key must be rejected at build time.
output context array = naming.segmentsFrom({ environment: 'prod', region: 'uksouth' })
