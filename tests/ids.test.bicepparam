using './ids.test.bicep'

// Unit tests. bicep build-params evaluates these expressions with the Bicep
// engine itself, so the compiled parameters are the actual function results;
// tests/compare.py diffs them against tests/ids.test.expected.json.
// Named imports only: importing the namespace would pull in armResourceId,
// which depends on the deployment-context resourceId function and cannot be
// evaluated while building a parameters file (BCP452).

import { providerType, armResourceIdIn } from '../modules/ids/ids.bicep'

param storageProviderType = providerType('storage_account')
param keyVaultProviderType = providerType('key_vault_vault')
param webAppProviderType = providerType('site_web_app')
param managedClusterProviderType = providerType('container_service_managed_cluster')
param functionAppProviderType = providerType('site_function_app')
param storageAccountId = armResourceIdIn('11111111-1111-1111-1111-111111111111', 'rg-contoso-demo-uks-shared', 'storage_account', 'stcontosodemouksshared')
param keyVaultAccountId = armResourceIdIn('22222222-2222-2222-2222-222222222222', 'rg-contoso-demo-uks-shared', 'key_vault_vault', 'kv-contoso-demo-uks-shar')
param webAppAccountId = armResourceIdIn('11111111-1111-1111-1111-111111111111', 'rg-contoso-demo-uks', 'site_web_app', 'app-contoso-demo-uks-api')
param managedClusterAccountId = armResourceIdIn('11111111-1111-1111-1111-111111111111', 'rg-contoso-demo-uks-shared', 'container_service_managed_cluster', 'aks-contoso-demo-uks-shared')
param logAnalyticsAccountId = armResourceIdIn('33333333-3333-3333-3333-333333333333', 'rg-contoso-demo', 'operational_insights_workspace', 'log-contoso-demo')
