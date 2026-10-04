# Supported resource types

Type keys for the ids functions with their ARM resource provider types.
Keys follow the [naming module](../naming/README.md)'s catalogue, so the same
key names a resource with the naming functions and identifies it with the ids
functions. Provider type strings are verified against the
[Microsoft Learn ARM reference](https://learn.microsoft.com/azure/templates/).
Only top-level resource types are included: types whose ID is
`/subscriptions/<sub>/resourceGroups/<rg>/providers/<type>/<name>`.

| Type key | ARM resource type | Naming abbreviation |
|---|---|---|
| `account_open_ai` | `Microsoft.CognitiveServices/accounts` | `oai` |
| `action_group` | `Microsoft.Insights/actionGroups` | `ag` |
| `api_management_service` | `Microsoft.ApiManagement/service` | `apim` |
| `application_gateway` | `Microsoft.Network/applicationGateways` | `agw` |
| `automation_account` | `Microsoft.Automation/automationAccounts` | `aa` |
| `availability_set` | `Microsoft.Compute/availabilitySets` | `avail` |
| `azure_firewall` | `Microsoft.Network/azureFirewalls` | `afw` |
| `bastion_host` | `Microsoft.Network/bastionHosts` | `bas` |
| `batch_account` | `Microsoft.Batch/batchAccounts` | `ba` |
| `component` | `Microsoft.Insights/components` | `appi` |
| `compute_virtual_machine` | `Microsoft.Compute/virtualMachines` | `vm` |
| `configuration_store` | `Microsoft.AppConfiguration/configurationStores` | `appcs` |
| `container_app` | `Microsoft.App/containerApps` | `ca` |
| `container_group` | `Microsoft.ContainerInstance/containerGroups` | `ci` |
| `container_service_managed_cluster` | `Microsoft.ContainerService/managedClusters` | `aks` |
| `database_account` | `Microsoft.DocumentDB/databaseAccounts` | `cosmos` |
| `databricks_workspace` | `Microsoft.Databricks/workspaces` | `dbw` |
| `db_for_my_sql_server` | `Microsoft.DBforMySQL/flexibleServers` | `mysql` |
| `db_for_postgre_sql_server` | `Microsoft.DBforPostgreSQL/flexibleServers` | `psql` |
| `disk` | `Microsoft.Compute/disks` | `dsk` |
| `dns_zone` | `Microsoft.Network/dnsZones` | `dns` |
| `event_hub_namespace` | `Microsoft.EventHub/namespaces` | `evhns` |
| `factory` | `Microsoft.DataFactory/factories` | `adf` |
| `hosting_environment_app_service_environment` | `Microsoft.Web/hostingEnvironments` | `ase` |
| `iot_hub` | `Microsoft.Devices/IotHubs` | `iot` |
| `key_vault_vault` | `Microsoft.KeyVault/vaults` | `kv` |
| `load_balancer` | `Microsoft.Network/loadBalancers` | `lb` |
| `machine_learning_workspace` | `Microsoft.MachineLearning/workspaces` | `machinelearningworkspace` |
| `managed_environment` | `Microsoft.App/managedEnvironments` | `cae` |
| `managed_hsm` | `Microsoft.KeyVault/managedHSMs` | `kvmhsm` |
| `managed_instance` | `Microsoft.Sql/managedInstances` | `sqlmi` |
| `network_interface` | `Microsoft.Network/networkInterfaces` | `nic` |
| `network_security_group` | `Microsoft.Network/networkSecurityGroups` | `nsg` |
| `operational_insights_workspace` | `Microsoft.OperationalInsights/workspaces` | `log` |
| `private_dns_zone` | `Microsoft.Network/privateDnsZones` | `pdns` |
| `private_endpoint` | `Microsoft.Network/privateEndpoints` | `pep` |
| `proximity_placement_group` | `Microsoft.Compute/proximityPlacementGroups` | `ppg` |
| `public_ip_address` | `Microsoft.Network/publicIPAddresses` | `pip` |
| `purview_account` | `Microsoft.Purview/accounts` | `pview` |
| `recovery_services_vault` | `Microsoft.RecoveryServices/vaults` | `rsv` |
| `redis` | `Microsoft.Cache/redis` | `redis` |
| `registry` | `Microsoft.ContainerRegistry/registries` | `cr` |
| `resource_group` | `Microsoft.Resources/resourceGroups` | `rg` |
| `route_table` | `Microsoft.Network/routeTables` | `rt` |
| `search_service` | `Microsoft.Search/searchServices` | `srch` |
| `server_farm` | `Microsoft.Web/serverfarms` | `asp` |
| `service_bus_namespace` | `Microsoft.ServiceBus/namespaces` | `sbns` |
| `site_function_app` | `Microsoft.Web/sites` | `func` |
| `site_web_app` | `Microsoft.Web/sites` | `app` |
| `sql_server` | `Microsoft.Sql/servers` | `sql` |
| `ssh_public_key` | `Microsoft.Compute/sshPublicKeys` | `sshkey` |
| `static_site` | `Microsoft.Web/staticSites` | `stapp` |
| `storage_account` | `Microsoft.Storage/storageAccounts` | `st` |
| `synapse_workspace` | `Microsoft.Synapse/workspaces` | `synw` |
| `topic` | `Microsoft.EventGrid/topics` | `egt` |
| `traffic_manager_profile` | `Microsoft.Network/trafficmanagerprofiles` | `traf` |
| `user_assigned_identity` | `Microsoft.ManagedIdentity/userAssignedIdentities` | `id` |
| `virtual_machine_scale_set` | `Microsoft.Compute/virtualMachineScaleSets` | `vmss` |
| `virtual_network` | `Microsoft.Network/virtualNetworks` | `vnet` |
| `virtual_network_gateway` | `Microsoft.Network/virtualNetworkGateways` | `vgw` |
