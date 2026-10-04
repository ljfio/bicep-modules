import * as env from '../../modules/env/env.bicep'

// An unknown environment tier must be rejected by the environmentName union.
output policy object = env.policy('production', {})
