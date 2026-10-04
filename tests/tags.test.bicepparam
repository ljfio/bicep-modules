using './tags.test.bicep'

import * as tags from '../modules/tags/tags.bicep'

// Unit tests. bicep build-params evaluates these expressions with the Bicep
// engine itself, so the compiled parameters are the actual function results;
// tests/compare.py diffs them against tests/tags.test.expected.json.

// standardTags: full context produces the full PascalCase tag bag; the region
// value passes through exactly as provided, without abbreviation.
param fullContextTags = tags.standardTags({
  workload: 'contoso'
  environment: 'prod'
  region: 'UK South'
  organization: 'platform'
  component: 'api'
  owner: 'platform-team'
  costCenter: 'cc-123'
})

// standardTags: partial context yields only the non-empty tags.
param partialContextTags = tags.standardTags({ workload: 'contoso', region: 'westeurope' })

// standardTags: empty optional values are omitted rather than emitted as
// blank tags; the required workload is the only survivor here.
param emptyOptionalTags = tags.standardTags({ workload: 'contoso', environment: '', region: '   ', component: '' })

// standardTags: values are trimmed.
param trimmedValuesTags = tags.standardTags({ workload: '  contoso  ', owner: ' team@contoso.com ' })

// mergeTags: override values win, other keys pass through.
param mergedOverrideTags = tags.mergeTags(
  { Workload: 'contoso', Environment: 'prod', Region: 'westeurope' },
  { Environment: 'dev', Owner: 'platform-team' })

// mergeTags: an empty override leaves the base bag untouched.
param mergedEmptyOverrideTags = tags.mergeTags({ Workload: 'contoso', Environment: 'prod' }, {})

// mergeTags: the merge is shallow - nested objects are replaced wholesale.
param mergedNestedReplaceTags = tags.mergeTags({ Extra: { a: 1 } }, { Extra: { b: 2 } })

// Composition: standardTags output feeds mergeTags as the base bag.
param composedTags = tags.mergeTags(
  tags.standardTags({ workload: 'contoso', environment: 'demo', region: 'uksouth' }),
  { Component: 'shared' })
