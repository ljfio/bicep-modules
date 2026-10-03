# bicep-modules

Custom Bicep module library, published to GitHub Container Registry as OCI
artifacts and consumed with Bicep module aliases.

| Module | Path | Description |
|---|---|---|
| [naming](modules/naming/README.md) | `br:ghcr.io/ljfio/bicep-modules/naming:<version>` | Resource name functions compliant with each resource type's naming rules |

## Modules

### naming

Composes Azure resource names from an array of naming segments
(workload, environment, region, component, ...), enforcing per-resource-type
rules automatically: hyphens vs compact join, lower case, and maximum name
length. Type abbreviations follow the Cloud Adoption Framework; region
abbreviations cover every Azure region. See the
[module README](modules/naming/README.md) for the full API and catalogue.

## Publishing

Modules are published by [`.github/workflows/publish.yml`](.github/workflows/publish.yml):

1. Validation job lints the module, builds the test template and asserts the
   generated names (`tests/verify.py`).
2. Publishing to `ghcr.io/<owner>/bicep-modules/naming:<version>` runs on git
   tags (`v1.0.0` publishes version `1.0.0`) or via `workflow_dispatch`.

The first publish creates a private ghcr.io package. For anonymous pulls from
other machines and CI, change the package visibility to public once:
GitHub -> Packages -> bicep-modules -> Package settings -> Change visibility.

Versioning: bump the patch/minor for new resource types and regions, major for
breaking changes to the exported function signatures.

## Consuming

Add a `bicepconfig.json` next to the consuming Bicep files:

```json
{
  "moduleAliases": {
    "br": {
      "ljfio": {
        "registry": "ghcr.io",
        "modulePath": "ljfio/bicep-modules"
      }
    }
  }
}
```

Then import the naming functions:

```bicep
import * as naming from 'br/ljfio:naming:0.1.0'

var segments = ['contoso', 'demo', 'uksouth', 'shared']

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-03-01' = {
  name: naming.resourceName('resource_group', segments) // rg-contoso-demo-uks-shared
  location: 'uksouth'
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: naming.resourceName('storage_account', segments) // stcontosodemouksshared
  location: 'uksouth'
  kind: 'StorageV2'
  sku: { name: 'Standard_LRS' }
}
```

Verify a consumer:

```bash
az bicep restore --file infra/main.bicep
az bicep build --file infra/main.bicep --stdout > /dev/null
```

### Naming context for nested modules

Define the core segments once as a context object and pass it down; nested
modules name their resources with `resourceNameFrom` without repeating the
core segments:

```bicep
// main.bicep
var namingContext = { workload: workload, environment: environment, region: location }

module api 'modules/api.bicep' = {
  name: naming.resourceNameFrom('resource_group', namingContext, ['api'])
  params: {
    namingContext: namingContext
  }
}
```

```bicep
// modules/api.bicep
param namingContext object

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: naming.resourceNameFrom('storage_account', namingContext, ['shared'])
  // -> stcontosodemouksshared
}
```

Context keys, in order and all optional: `organization`, `workload`,
`environment`, `region`, `component`. Keep resource names workload-centric —
the Cloud Adoption Framework puts organization and team structure in management
groups, subscriptions, and tags rather than in resource names; see the
[module README](modules/naming/README.md) for the full rationale and API.

## Layout

```
bicep-modules/
├── modules/
│   └── naming/
│       ├── naming.bicep        (naming function library)
│       └── README.md           (API, region + resource type catalogue)
├── tests/
│   ├── naming.test.bicep       (template exercising every export)
│   └── verify.py               (evaluates the compiled template, asserts names)
├── bicepconfig.json
└── .github/workflows/publish.yml
```
