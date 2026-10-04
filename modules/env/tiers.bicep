@export()
@description('Environment tier names supported by the env library. The tiers are a convention, not an Azure concept: they are the keys of the tier policy catalogue below. Hand-written; keep this union and the `tierPolicies` keys in sync.')
type environmentName = 'dev'
  | 'test'
  | 'uat'
  | 'stage'
  | 'prod'
  | 'demo'

@export()
@description('Default policies per environment tier. Every value is a documented convention of this library - an opinion to override via the `policy` function, not a claim about Azure: nothing in Azure requires these values, and organizations differ. Rationale per tier: `dev`, `test` and `demo` run single, non-HA instances; `uat` mirrors the production topology at reduced scale; `stage` runs production configuration (hence `isProduction: true`, keeping strict SLA and production-like settings in place) at reduced scale; `prod` requires HA with three replicas and zone-redundant storage. Hand-written.')
var tierPolicies = {
  dev: {
    isProduction: false
    haRequired: false
    replicas: 1
    extra: {}
  }
  test: {
    isProduction: false
    haRequired: false
    replicas: 1
    extra: {}
  }
  uat: {
    isProduction: false
    haRequired: true
    replicas: 2
    extra: {}
  }
  stage: {
    isProduction: true
    haRequired: true
    replicas: 2
    extra: {}
  }
  prod: {
    isProduction: true
    haRequired: true
    replicas: 3
    extra: {
      zoneRedundant: true
    }
  }
  demo: {
    isProduction: false
    haRequired: false
    replicas: 1
    extra: {}
  }
}
