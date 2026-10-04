# env

Bicep function library that turns an environment tier name into a policy
object, so modules derive per-environment settings from one string instead of
scattering ternaries.

- The tier catalogue (`tiers.bicep`) and this README are hand-written; there
  is no generator script and no generated catalogue doc.
- **The defaults are conventions, not claims about Azure.** Nothing in Azure
  requires them and organizations differ; every value is an opinion to
  override via `policy`, and the catalogue is deliberately small so it stays
  auditable.

## Usage

```bicep
import * as env from 'br/ljfio:env:0.3.0'
import * as naming from 'br/ljfio:naming:0.3.0'

param environment env.environmentName = 'prod'

var policy = env.policy(environment, {
  extra: { sku: 'Standard_LRS' }
})

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: naming.resourceName('storage_account', ['contoso', environment, 'uksouth', 'shared'])
  location: 'uksouth'
  kind: 'StorageV2'
  sku: {
    name: policy.extra.sku
  }
}

module api 'modules/api.bicep' = {
  name: naming.resourceName('resource_group', ['contoso', environment, 'uksouth', 'api'])
  params: {
    namingContext: {
      workload: 'contoso'
      environment: environment
      region: 'uksouth'
    }
    replicas: policy.replicas
    isProduction: policy.isProduction
  }
}
```

Pairing with the [naming](../naming/README.md) module: the same `environment`
string feeds `env.policy` and the naming context's `environment` segment, so
names and settings stay in lockstep across tiers.

## Exported types

| Type | Description |
|---|---|
| `environmentName` | Union of the supported tiers: `dev`, `test`, `uat`, `stage`, `prod`, `demo`. |
| `tierPolicy` | Sealed object type with `isProduction` (bool), `haRequired` (bool), `replicas` (int), `extra` (object); type your nested module parameters with it. |

## Functions

| Function | Description |
|---|---|
| `policy(environment environmentName, overrides object)` | The tier defaults merged with `overrides`: override keys win, sibling keys are preserved, and nested objects (`extra`) merge recursively. Pass `{}` for the plain defaults. |
| `isProduction(environment environmentName)` | Whether the tier is treated as production; gates strict settings without ternaries. |

## Merge semantics

Bicep 0.47 has no native `deepMerge` function, so `policy` merges with
`union()`:

- Override keys win; sibling default keys are preserved.
- Nested objects merge recursively: an `extra` override keeps the default
  `extra` keys. Nested arrays are replaced whole.
- Unknown override keys pass through alongside the defaults.
- A null-valued override key is dropped in favour of the default.

## Tier defaults

Every value is this library's documented convention - an opinion to override,
not a claim about Azure:

| Tier | `isProduction` | `haRequired` | `replicas` | `extra` | Rationale |
|---|---|---|---|---|---|
| `dev` | false | false | 1 | `{}` | Developer sandboxes run single, non-HA instances. |
| `test` | false | false | 1 | `{}` | Automated tests need no HA; keep them cheap. |
| `uat` | false | true | 2 | `{}` | UAT mirrors the production topology at reduced scale. |
| `stage` | true | true | 2 | `{}` | Staging runs production configuration (strict SLA, production-like settings), hence `isProduction: true`. |
| `prod` | true | true | 3 | `{ zoneRedundant: true }` | Production requires HA with headroom and zone-redundant storage. |
| `demo` | false | false | 1 | `{}` | Demos are disposable; single instances keep costs down. |
