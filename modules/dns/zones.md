# Private DNS zones

Zone keys for the dns functions, with the Private Endpoint Private DNS zone
Azure requires for each resource type group. Sourced from the
[Microsoft Learn private endpoint DNS configuration](https://learn.microsoft.com/azure/private-link/private-endpoint-dns)
appendix; type keys match the naming module's resource type keys.

| Type key | ARM resource type | Zone key | Private DNS zone |
|---|---|---|---|
| `database_account` | `Microsoft.DocumentDB/databaseAccounts` | `database_account` | `privatelink.documents.azure.com` |
| `database_account` | `Microsoft.DocumentDB/databaseAccounts` | `database_account_cassandra` | `privatelink.cassandra.cosmos.azure.com` |
| `database_account` | `Microsoft.DocumentDB/databaseAccounts` | `database_account_gremlin` | `privatelink.gremlin.cosmos.azure.com` |
| `database_account` | `Microsoft.DocumentDB/databaseAccounts` | `database_account_mongo` | `privatelink.mongo.cosmos.azure.com` |
| `database_account` | `Microsoft.DocumentDB/databaseAccounts` | `database_account_table` | `privatelink.table.cosmos.azure.com` |
| `db_for_my_sql_server` | `Microsoft.DBforMySQL/servers` | `db_for_my_sql_server` | `privatelink.mysql.database.azure.com` |
| `db_for_postgre_sql_server` | `Microsoft.DBforPostgreSQL/servers` | `db_for_postgre_sql_server` | `privatelink.postgres.database.azure.com` |
| `event_hub_namespace` | `Microsoft.EventHub/namespaces` | `event_hub_namespace` | `privatelink.servicebus.windows.net` |
| `factory` | `Microsoft.DataFactory/factories` | `factory` | `privatelink.datafactory.azure.net` |
| `key_vault_vault` | `Microsoft.KeyVault/vaults` | `key_vault_vault` | `privatelink.vaultcore.azure.net` |
| `redis` | `Microsoft.Cache/Redis` | `redis` | `privatelink.redis.cache.windows.net` |
| `registry` | `Microsoft.ContainerRegistry/registries` | `registry` | `privatelink.azurecr.io` |
| `service_bus_namespace` | `Microsoft.ServiceBus/namespaces` | `service_bus_namespace` | `privatelink.servicebus.windows.net` |
| `site_slot` | `Microsoft.Web/sites/slots` | `site_slot` | `privatelink.azurewebsites.net` |
| `site_web_app` | `Microsoft.Web/sites` | `site_web_app` | `privatelink.azurewebsites.net` |
| `sql_server` | `Microsoft.Sql/servers` | `sql_server` | `privatelink.database.windows.net` |
| `storage_account` | `Microsoft.Storage/storageAccounts` | `storage_account_blob` | `privatelink.blob.core.windows.net` |
| `storage_account` | `Microsoft.Storage/storageAccounts` | `storage_account_dfs` | `privatelink.dfs.core.windows.net` |
| `storage_account` | `Microsoft.Storage/storageAccounts` | `storage_account_file` | `privatelink.file.core.windows.net` |
| `storage_account` | `Microsoft.Storage/storageAccounts` | `storage_account_queue` | `privatelink.queue.core.windows.net` |
| `storage_account` | `Microsoft.Storage/storageAccounts` | `storage_account_table` | `privatelink.table.core.windows.net` |
