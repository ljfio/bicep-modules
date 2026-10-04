# tags

Bicep function library that composes the standard Azure tag bag from the same
context object the naming module uses, and merges tag objects with
override-wins semantics. The tagging sibling of
[naming](../naming/README.md).

- Tag key names and casing (`Workload`, `Environment`, `Region`,
  `Organization`, `Component`, `Owner`, `CostCenter`) follow the
  [Cloud Adoption Framework tag recommendations](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-tagging).
- The tagging context mirrors the naming module `namingContext` shape, plus
  the tag-specific `owner` and `costCenter` keys.

Repository layout: `tags.bicep` and this README are hand-written; the module
carries no generated data.

## Usage

```bicep
import * as tags from 'br/ljfio:tags:0.3.0'

param workload string = 'contoso'
param environment string = 'demo'
param location string = 'uksouth'

var tagContext = {
  workload: workload
  environment: environment
  region: location
  owner: 'platform-team'
  costCenter: 'cc-123'
}

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: 'rg-contoso-demo-uks'
  location: location
  tags: tags.standardTags(tagContext)
  // -> { Workload: 'contoso', Environment: 'demo', Region: 'uksouth',
  //      Owner: 'platform-team', CostCenter: 'cc-123' }
}
```

Add per-resource tags (for example the component) on top of the shared bag
with `mergeTags`; override values win:

```bicep
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'stcontosodemouksshared'
  location: location
  tags: tags.mergeTags(tags.standardTags(tagContext), { Component: 'shared' })
  ...
}
```

## Key casing convention

Tag keys are PascalCase (`Workload`, `Environment`, ...), the convention the
Cloud Adoption Framework tag examples use. Tag values are trimmed and used as
provided; empty or missing context keys are omitted rather than emitted as
blank tags. The `region` value stays exactly as provided, without the
abbreviation the naming functions apply (`uksouth` in, `uksouth` out - not
`uks`).

## Pairing with the naming module

The context object is defined once and feeds both modules: the naming module
turns it into resource names, the tags module into the standard tag bag. The
naming module carries the Cloud Adoption Framework guidance that organization
and team structure belongs in tags, not resource names - this module is where
it lands.

```bicep
import * as naming from 'br/ljfio:naming:0.3.0'
import * as tags from 'br/ljfio:tags:0.3.0'

param workload string = 'contoso'
param environment string = 'demo'
param location string = 'uksouth'

var context = { workload: workload, environment: environment, region: location }

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: naming.resourceNameFrom('resource_group', context, [])
  location: location
  tags: tags.standardTags({ ...context, owner: 'platform-team' })
}
```

The two context types are independent: `tagContext` is `namingContext` plus
`owner` and `costCenter`. A context holding only the shared keys assigns to
both, so keep the shared object minimal and spread the tag-specific keys in
at the call site - `namingContext` is sealed and rejects `owner`/`costCenter`.

## Exported types

| Type | Description |
|---|---|
| `tagContext` | Sealed object type with the `organization`, `workload` (required), `environment`, `region`, `component`, `owner`, `costCenter` (optional) keys; type your parameters with it. Unknown keys are rejected at build time. |

## Functions

| Function | Description |
|---|---|
| `standardTags(context tagContext)` | Flat tag bag with PascalCase keys: `Workload`, `Environment`, `Region`, `Organization`, `Component`, `Owner`, `CostCenter`. Values trimmed; empty or missing keys omitted; region passed through exactly as provided. |
| `mergeTags(base object, override object)` | Merges two tag bags; `override` values win on conflicting keys. Shallow merge: nested objects are replaced wholesale, not merged recursively - fine for flat string tag bags. |
