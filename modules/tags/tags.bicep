@description('Tagging context for `standardTags`: the same shape as the naming module `namingContext` plus the tag-specific `owner` and `costCenter` keys. Define the core context once (workload, environment, region) and feed the same object to the naming module for resource names and here for the standard tag bag. `workload` is required - it is the primary tagging component per the Cloud Adoption Framework; all other keys are optional. Unlike the naming functions, the `region` value is used exactly as provided, without abbreviation. The type is sealed: unknown keys are rejected so context typos fail at build time.')
@sealed()
@export()
type tagContext = {
  @description('Organization tag. The Cloud Adoption Framework puts organization and team structure in tags rather than resource names; this is where it goes instead of the resource name.')
  organization: string?

  @description('Workload, application, or project the resource belongs to - the primary tagging component per the Cloud Adoption Framework. Required: without a workload tag the resource cannot be attributed to anything.')
  workload: string

  @description('Environment tag, for example `prod`, `dev`, `demo`.')
  environment: string?

  @description('Region tag; kept exactly as provided, without the abbreviation the naming functions apply (for example `uksouth` or `UK South`).')
  region: string?

  @description('Component tag, for the resource role within the workload (for example `shared`, `api`). Usually set per resource on top of the shared context tags via `mergeTags`.')
  component: string?

  @description('Owner tag: the accountable person or team, for example a team name or email address.')
  owner: string?

  @description('Cost center tag: the code the resource costs are charged to.')
  costCenter: string?
}

@description('Composes the standard tag bag from a tagging context: a flat object with PascalCase tag keys (`Workload`, `Environment`, `Region`, `Organization`, `Component`, `Owner`, `CostCenter`) per the Cloud Adoption Framework tag recommendations. Values are trimmed; empty or missing context keys are omitted, so the bag carries no blank tags. The `region` value stays exactly as provided, without abbreviation.')
@export()
func standardTags(context tagContext) object =>
  shallowMerge([
    trim(context.workload) == '' ? {} : { Workload: trim(context.workload) }
    trim(context.?environment ?? '') == '' ? {} : { Environment: trim(context.?environment ?? '') }
    trim(context.?region ?? '') == '' ? {} : { Region: trim(context.?region ?? '') }
    trim(context.?organization ?? '') == '' ? {} : { Organization: trim(context.?organization ?? '') }
    trim(context.?component ?? '') == '' ? {} : { Component: trim(context.?component ?? '') }
    trim(context.?owner ?? '') == '' ? {} : { Owner: trim(context.?owner ?? '') }
    trim(context.?costCenter ?? '') == '' ? {} : { CostCenter: trim(context.?costCenter ?? '') }
  ])

@description('Merges two tag bags: keys in `override` replace the same keys in `base`, other keys pass through. Built on the ARM `shallowMerge` function (Bicep 0.47 ships `shallowMerge` but no `deepMerge`): the merge is shallow, so a nested object in `override` replaces the base value wholesale instead of merging recursively. Tag bags are flat string-to-string maps, so that is the expected semantic.')
@export()
func mergeTags(base object, override object) object =>
  shallowMerge([base, override])
