using './dns.test.bicep'

import * as dns from '../modules/dns/dns.bicep'

// Unit tests. bicep build-params evaluates these expressions with the Bicep
// engine itself, so the compiled parameters are the actual function results;
// tests/compare.py diffs them against tests/dns.test.expected.json.

param storageBlobZone = dns.privateDnsZone('storage_account_blob')
param storageFileZone = dns.privateDnsZone('storage_account_file')
param keyVaultZone = dns.privateDnsZone('key_vault_vault')
param sqlServerZone = dns.privateDnsZone('sql_server')
param postgresqlZone = dns.privateDnsZone('db_for_postgre_sql_server')
param mysqlZone = dns.privateDnsZone('db_for_my_sql_server')
param eventHubsZone = dns.privateDnsZone('event_hub_namespace')
param serviceBusZone = dns.privateDnsZone('service_bus_namespace')
param containerRegistryZone = dns.privateDnsZone('registry')
param cosmosDbZone = dns.privateDnsZone('database_account')
param cosmosMongoZone = dns.privateDnsZone('database_account_mongo')
param webAppZone = dns.privateDnsZone('site_web_app')
param slotZone = dns.privateDnsZone('site_slot')
param redisZone = dns.privateDnsZone('redis')
param dataFactoryZone = dns.privateDnsZone('factory')
param storageZones = dns.privateDnsZones('storage_account')
param storageZoneCount = length(dns.privateDnsZones('storage_account'))
param keyVaultZones = dns.privateDnsZones('key_vault_vault')
param unknownTypeZones = dns.privateDnsZones('not_a_resource_type')
