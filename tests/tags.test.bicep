import * as tags from '../modules/tags/tags.bicep'

// Using-target for tests/tags.test.bicepparam: every parameter is a unit
// test assertion. The parameter file computes the values with the tags
// functions, and tests/tags.test.expected.json holds the expected results.
// The parameter types double as return-type and shape assertions: an
// assignment whose type does not match fails the build.

param fullContextTags object
param partialContextTags object
param emptyOptionalTags object
param trimmedValuesTags object
param mergedOverrideTags object
param mergedEmptyOverrideTags object
param mergedNestedReplaceTags object
param composedTags object

// Boundary smoke test: compiling this template proves the module's exported
// functions inline into an ordinary ARM template and compose in template
// expressions. The ARM engine's evaluation is trusted, not re-tested here.
output smokeStorageAccountTags object = tags.mergeTags(
  tags.standardTags({ workload: 'contoso', environment: 'demo', region: 'uksouth' }),
  { Component: 'shared' })

// Reference every parameter so the target stays lint-clean.
output assignedValues object = {
  fullContextTags: fullContextTags
  partialContextTags: partialContextTags
  emptyOptionalTags: emptyOptionalTags
  trimmedValuesTags: trimmedValuesTags
  mergedOverrideTags: mergedOverrideTags
  mergedEmptyOverrideTags: mergedEmptyOverrideTags
  mergedNestedReplaceTags: mergedNestedReplaceTags
  composedTags: composedTags
}
