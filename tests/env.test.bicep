import * as env from '../modules/env/env.bicep'

// Using-target for tests/env.test.bicepparam: every parameter is a unit
// test assertion. The parameter file computes the values with the env
// functions, and tests/env.test.expected.json holds the expected results.
// The parameter types double as return-type assertions: an assignment whose
// type does not match fails the build.

param devPolicy object
param testPolicy object
param uatPolicy object
param stagePolicy object
param prodPolicy object
param demoPolicy object
param devReplicas int
param uatReplicas int
param prodReplicas int
param devIsProduction bool
param testIsProduction bool
param uatIsProduction bool
param stageIsProduction bool
param prodIsProduction bool
param demoIsProduction bool
param overrideWins object
param overrideReplicas int
param extraDeepMerge object
param overrideNewKey object
param nullOverrideDropped int

// Boundary smoke test: compiling this template proves the module's exported
// functions inline into an ordinary ARM template and compose in template
// expressions. The ARM engine's evaluation is trusted, not re-tested here.
output smokePolicy object = env.policy('stage', { extra: { telemetry: 'basic' } })
output smokeIsProduction bool = env.isProduction('stage')

// Reference every parameter so the target stays lint-clean.
output assignedValues object = {
  devPolicy: devPolicy
  testPolicy: testPolicy
  uatPolicy: uatPolicy
  stagePolicy: stagePolicy
  prodPolicy: prodPolicy
  demoPolicy: demoPolicy
  devReplicas: devReplicas
  uatReplicas: uatReplicas
  prodReplicas: prodReplicas
  devIsProduction: devIsProduction
  testIsProduction: testIsProduction
  uatIsProduction: uatIsProduction
  stageIsProduction: stageIsProduction
  prodIsProduction: prodIsProduction
  demoIsProduction: demoIsProduction
  overrideWins: overrideWins
  overrideReplicas: overrideReplicas
  extraDeepMerge: extraDeepMerge
  overrideNewKey: overrideNewKey
  nullOverrideDropped: nullOverrideDropped
}
