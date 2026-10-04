using './naming.test.bicep'

import * as naming from '../modules/naming/naming.bicep'

// Unit tests. bicep build-params evaluates these expressions with the Bicep
// engine itself, so the compiled parameters are the actual function results;
// tests/compare.py diffs them against tests/naming.test.expected.json.

param hyphenTypeName = naming.resourceName('site_web_app', ['contoso', 'demo', 'uksouth', 'api'])
param compactTypeName = naming.resourceName('storage_account', ['contoso', 'demo', 'uksouth', 'shared'])
param lowercaseTypeName = naming.resourceName('database_account', ['Contoso', 'Demo', 'UK South', 'shared'])
param truncatedStorageName = naming.resourceName('storage_account', ['contoso', 'demo', 'uksouth', 'shared', 'longsegment'])
param truncatedKeyVaultName = naming.resourceName('key_vault_vault', ['contoso', 'demo', 'uksouth', 'shared'])
param forcedCompactName = naming.compactResourceName('site_web_app', ['contoso', 'demo', 'uksouth', 'api'])
param regionFromCliName = naming.regionCode('westeurope')
param regionFromDisplayName = naming.regionCode('West Europe')
param unknownRegionName = naming.regionCode('notaregion')
param abbreviation = naming.resourceAbbreviation('resource_group')
param maxLength = naming.resourceNameMaxLength('storage_account')
param segmentArrayOrder = naming.resourceName('site_web_app', ['contoso', 'demo', 'uksouth', '', 'api', 'web'])
param noLimitTypeName = naming.resourceName('cloud_service', ['contoso', 'demo', 'uksouth'])
param noLimitMaxLength = naming.resourceNameMaxLength('cloud_service')
param contextTypeName = naming.resourceNameFrom('storage_account', { workload: 'contoso', environment: 'demo', region: 'uksouth' }, ['shared'])
param contextPartialName = naming.resourceNameFrom('resource_group', { workload: 'contoso', region: 'UK South' }, ['app'])
param contextComponentName = naming.resourceNameFrom('key_vault_vault', { workload: 'contoso', environment: 'demo', region: 'uksouth', component: 'shared' }, null)
param contextOrganizationName = naming.resourceNameFrom('resource_group', { organization: 'platform', workload: 'contoso', region: 'uksouth' }, [])
param contextNullExtrasName = naming.resourceNameFrom('site_web_app', { workload: 'contoso', environment: 'demo', region: 'uksouth' }, null)
param contextSegments = naming.segmentsFrom({ workload: 'contoso', region: 'westeurope' })

// mergeContext: overrides replace, absent/null keys keep the base value, and an
// empty string clears the base segment.

// The assignment type-checks against namingContext: mergeContext must return
// a valid naming context. Override environment and region; keep organization,
// workload, component from the base.
param mergedContext = naming.mergeContext({ organization: 'platform', workload: 'contoso', environment: 'dev', region: 'uksouth', component: 'api' }, { environment: 'demo', region: 'westeurope' })
param mergedContextName = naming.resourceNameFrom('site_web_app', naming.mergeContext({ workload: 'contoso', environment: 'dev', region: 'uksouth' }, { environment: 'demo', region: 'westeurope', component: 'api' }), null)
param mergedContextSegments = naming.segmentsFrom(naming.mergeContext({ workload: 'contoso', environment: 'dev', region: 'uksouth' }, { environment: 'demo', region: 'westeurope' }))
param mergedClearedEnvironmentName = naming.resourceNameFrom('resource_group', naming.mergeContext({ workload: 'contoso', environment: 'demo', region: 'uksouth' }, { environment: '' }), ['web'])
param mergedNullOverrideKeepsBaseSegments = naming.segmentsFrom(naming.mergeContext({ workload: 'contoso', region: 'westeurope' }, { region: null }))
