import * as naming from '../modules/naming/naming.bicep'

// Fixtures for the naming convention: resource groups allow hyphens,
// storage accounts must be compact and lower case.
output resourceGroupName string = naming.resourceName('resource_group', ['contoso', 'demo', 'uksouth'])
output storageAccountName string = naming.resourceName('storage_account', ['contoso', 'demo', 'uksouth', 'shared'])
output webAppName string = naming.resourceName('site_web_app', ['contoso', 'demo', 'UK South', 'api'])
output keyVaultName string = naming.resourceName('key_vault_vault', ['contoso', 'demo', 'uksouth', 'shared'])
output compactForced string = naming.compactResourceName('site_web_app', ['contoso', 'demo', 'uksouth', 'api'])
output truncatedName string = naming.resourceName('storage_account', ['contoso', 'demo', 'uksouth', 'shared', 'longsegment'])
output regionFromCli string = naming.regionCode('westeurope')
output regionFromDisplay string = naming.regionCode('West Europe')
output regionUnknownPassesThrough string = naming.regionCode('notaregion')
output resourceGroupAbbreviation string = naming.resourceAbbreviation('resource_group')
output storageAccountMaxLength int = naming.resourceNameMaxLength('storage_account')
output segmentArrayOrder string = naming.resourceName('site_web_app', ['contoso', 'demo', 'uksouth', '', 'api', 'web'])
