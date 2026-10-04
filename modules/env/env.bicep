import { environmentName as environmentTiers, tierPolicies } from 'tiers.bicep'

@description('Environment tier names supported by the env library; re-exported from tiers.bicep for consumers. The tiers (`dev`, `test`, `uat`, `stage`, `prod`, `demo`) are a convention, not an Azure concept.')
@export()
type environmentName = environmentTiers

@description('Policy for an environment tier: the knobs modules commonly derive from the environment. The type is sealed: unknown keys are rejected. `isProduction` treats the tier as production for gating strict settings (SLA, diagnostics retention, security hardening); `haRequired` marks tiers that must tolerate component failure; `replicas` is a conventional instance count for stateless services; `extra` carries any additional per-tier settings (deep-merged with caller overrides by the `policy` function).')
@sealed()
@export()
type tierPolicy = {
  @description('Whether the tier is treated as production (see `isProduction`).')
  isProduction: bool

  @description('Whether high availability is required in this tier.')
  haRequired: bool

  @description('Conventional replica count for a stateless service in this tier.')
  replicas: int

  @description('Additional per-tier settings; merged recursively with the overrides passed to `policy`.')
  extra: object
}

@description('Returns the policy for an environment tier: the tier defaults deep-merged with `overrides`, where override keys win and sibling keys are preserved. Merging uses `union()`: nested objects are merged recursively too (an `extra` override keeps the default `extra` keys), nested arrays are replaced whole, and a null-valued override key is dropped in favour of the default. Bicep 0.47 has no native `deepMerge`, hence `union()`; pass `{}` when no overrides are needed. Every default is a documented convention of this library - override whatever does not match your organization.')
@export()
func policy(environment environmentName, overrides object) object =>
  union(tierPolicies[environment], overrides)

@description('Whether the environment tier is treated as production: gates strict settings (SLA, diagnostics retention, security hardening) without scattering ternaries. True for `prod` and for `stage`, which runs production configuration; every other tier is false.')
@export()
func isProduction(environment environmentName) bool =>
  tierPolicies[environment].isProduction
