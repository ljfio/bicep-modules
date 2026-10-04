using './env.test.bicep'

import * as env from '../modules/env/env.bicep'

// Unit tests. bicep build-params evaluates these expressions with the Bicep
// engine itself, so the compiled parameters are the actual function results;
// tests/compare.py diffs them against tests/env.test.expected.json.

// Tier defaults.
param devPolicy = env.policy('dev', {})
param testPolicy = env.policy('test', {})
param uatPolicy = env.policy('uat', {})
param stagePolicy = env.policy('stage', {})
param prodPolicy = env.policy('prod', {})
param demoPolicy = env.policy('demo', {})

// Typed default assertions.
param devReplicas = env.policy('dev', {}).replicas
param uatReplicas = env.policy('uat', {}).replicas
param prodReplicas = env.policy('prod', {}).replicas

// isProduction per tier.
param devIsProduction = env.isProduction('dev')
param testIsProduction = env.isProduction('test')
param uatIsProduction = env.isProduction('uat')
param stageIsProduction = env.isProduction('stage')
param prodIsProduction = env.isProduction('prod')
param demoIsProduction = env.isProduction('demo')

// Override semantics: the override wins, sibling keys are preserved.
param overrideWins = env.policy('prod', { replicas: 5 })
param overrideReplicas = env.policy('prod', { replicas: 5 }).replicas

// Nested objects merge recursively: the extra override keeps the default keys.
param extraDeepMerge = env.policy('prod', { extra: { telemetry: 'full' } }).extra

// Unknown override keys pass through alongside the defaults.
param overrideNewKey = env.policy('test', { retireAfterDays: 30 })

// A null-valued override key is dropped in favour of the default.
param nullOverrideDropped = env.policy('dev', { replicas: null }).replicas
