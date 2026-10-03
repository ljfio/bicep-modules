@description('Resource type identifiers supported by the naming library. Keys follow the Azure Verified Naming Utility resource catalog (https://github.com/Azure/terraform-azure-avm-utl-naming); abbreviations follow the Cloud Adoption Framework recommendations (https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations) as catalogued by the Azure Periodic Table (azureperiodictable.com); length, separator and case rules follow the Azure resource naming rules (https://learn.microsoft.com/azure/azure-resource-manager/management/resource-name-rules).')
@export()
type resourceType = 'access_connector'
  | 'account_ai_services'
  | 'account_cognitive_services'
  | 'account_compute_policy'
  | 'account_computer_vision'
  | 'account_content_moderator'
  | 'account_content_safety'
  | 'account_custom_vision_prediction'
  | 'account_custom_vision_training'
  | 'account_data_lake_store_account'
  | 'account_face'
  | 'account_form_recognizer'
  | 'account_health_insights'
  | 'account_immersive_reader'
  | 'account_open_ai'
  | 'account_project'
  | 'account_speech_services'
  | 'account_storage_account'
  | 'account_text_analytics'
  | 'account_text_translation'
  | 'account_virtual_network_rule'
  | 'action_group'
  | 'action_rule'
  | 'activity_log_alert'
  | 'advanced_threat_protection_setting'
  | 'alerts_suppression_rule'
  | 'analysis_services_server'
  | 'api_management_service'
  | 'app_job'
  | 'application_gateway'
  | 'application_gateway_web_application_firewall_policy'
  | 'application_group'
  | 'application_security_group'
  | 'assessment'
  | 'assessment_metadata'
  | 'assessment_project'
  | 'association'
  | 'auto_provisioning_setting'
  | 'auto_scale_setting'
  | 'automation'
  | 'automation_account'
  | 'automation_account_certificate'
  | 'automation_account_connection'
  | 'automation_account_credential'
  | 'automation_account_runbook'
  | 'automation_account_schedule'
  | 'automation_account_variable'
  | 'automation_account_watcher'
  | 'automation_account_webhook'
  | 'availability_set'
  | 'azure_firewall'
  | 'backup_vault'
  | 'backup_vault_backup_policy'
  | 'backupvault_backup_instance'
  | 'bare_metal_machine'
  | 'bare_metal_machine_key_set'
  | 'bastion_host'
  | 'batch_account'
  | 'batch_account_application'
  | 'batch_account_certificate'
  | 'batch_account_pool'
  | 'blob'
  | 'blockchain_member'
  | 'blueprint'
  | 'blueprint_assignment'
  | 'bmc_key_set'
  | 'bot_service_azurebot'
  | 'bot_service_channel'
  | 'bot_service_channel_direct_line'
  | 'bot_service_channel_email'
  | 'bot_service_channel_ms_teams'
  | 'bot_service_channel_slack'
  | 'bot_service_channels_registration'
  | 'bot_service_connection'
  | 'budget'
  | 'certificate'
  | 'certificate_order'
  | 'cloud_service'
  | 'cloud_services_network'
  | 'cluster_database'
  | 'cluster_database_data_connection'
  | 'cluster_database_data_connection_event_hub'
  | 'cluster_database_eventhubconnection'
  | 'cluster_h_base'
  | 'cluster_hadoop'
  | 'cluster_interactive_query'
  | 'cluster_kafka'
  | 'cluster_manager'
  | 'cluster_metrics_configuration'
  | 'cluster_ml_services'
  | 'cluster_rserver'
  | 'cluster_spark'
  | 'cluster_storm'
  | 'cognitive_services_account'
  | 'commitment_plan'
  | 'communication_service'
  | 'community'
  | 'community_community_endpoint'
  | 'community_dedicated_hub'
  | 'community_transit_hub'
  | 'component'
  | 'compute_virtual_machine'
  | 'configuration_store'
  | 'configuration_store_replica'
  | 'connected_cluster'
  | 'connection'
  | 'connector'
  | 'container_app'
  | 'container_group'
  | 'container_service_managed_cluster'
  | 'cosmosdb_cassandra_cluster'
  | 'cosmosdb_cassandra_datacenter'
  | 'dashboard'
  | 'data_box_job'
  | 'data_collection_endpoint'
  | 'data_collection_rule'
  | 'data_collection_rule_association'
  | 'data_lake_analytics_account'
  | 'data_lake_analytics_account_firewall_rule'
  | 'data_lake_store_account'
  | 'data_lake_store_account_firewall_rule'
  | 'data_migration_service'
  | 'database_account'
  | 'database_account_cosmos_db_for_apache_cassandra_account'
  | 'database_account_cosmos_db_for_apache_gremlin_account'
  | 'database_account_cosmos_db_for_mongo_db_account'
  | 'database_account_cosmos_db_for_no_sql_account'
  | 'database_account_cosmos_db_for_table_account'
  | 'database_account_sql_database'
  | 'databricks_cluster'
  | 'databricks_high_concurrency_cluster'
  | 'databricks_standard_cluster'
  | 'databricks_workspace'
  | 'db_for_maria_db_server'
  | 'db_for_maria_db_server_database'
  | 'db_for_maria_db_server_firewall_rule'
  | 'db_for_maria_db_server_virtual_network_rule'
  | 'db_for_my_sql_server'
  | 'db_for_my_sql_server_database'
  | 'db_for_my_sql_server_firewall_rule'
  | 'db_for_my_sql_server_virtual_network_rule'
  | 'db_for_postgre_sql_server'
  | 'db_for_postgre_sql_server_database'
  | 'db_for_postgre_sql_server_firewall_rule'
  | 'db_for_postgre_sql_server_virtual_network_rule'
  | 'deployment'
  | 'deployment_script'
  | 'deployment_template_deployment'
  | 'desktop_virtualization_workspace'
  | 'dev_test_lab_lab'
  | 'device_security_group'
  | 'digital_twins_instance'
  | 'disk'
  | 'disk_access'
  | 'disk_encryption_set'
  | 'disk_managed_disk_data'
  | 'disk_managed_disk_o'
  | 'dns_a_record'
  | 'dns_aaaa_record'
  | 'dns_caa_record'
  | 'dns_cname_record'
  | 'dns_forwarding_ruleset'
  | 'dns_mx_record'
  | 'dns_ns_record'
  | 'dns_ptr_record'
  | 'dns_resolver'
  | 'dns_resolver_inbound_endpoint'
  | 'dns_resolver_outbound_endpoint'
  | 'dns_txt_record'
  | 'dns_zone'
  | 'domain'
  | 'domain_topic'
  | 'edge_cluster'
  | 'edge_cluster_node'
  | 'elastic_san'
  | 'elastic_san_volume_group'
  | 'enclave_connection'
  | 'enterprise_channel'
  | 'environment'
  | 'environment_access_policy'
  | 'environment_event_source'
  | 'environment_reference_data_set'
  | 'event_grid_namespace'
  | 'event_hub_cluster'
  | 'event_hub_namespace'
  | 'event_hub_namespace_authorization_rule'
  | 'event_hub_namespace_disaster_recovery_config'
  | 'event_subscription'
  | 'express_route_circuit'
  | 'express_route_gateway'
  | 'express_route_port'
  | 'fabric_capacity'
  | 'factory'
  | 'factory_dataflow'
  | 'factory_dataset'
  | 'factory_dataset_mysql_table'
  | 'factory_dataset_postgresql_table'
  | 'factory_dataset_sql_server_table'
  | 'factory_integration_runtime'
  | 'factory_integration_runtime_azure_ssis'
  | 'factory_linkedservice'
  | 'factory_linkedservice_data_lake_storage_gen2'
  | 'factory_linkedservice_key_vault'
  | 'factory_linkedservice_mysql'
  | 'factory_linkedservice_postgresql'
  | 'factory_linkedservice_sql_server'
  | 'factory_pipeline'
  | 'factory_trigger'
  | 'factory_trigger_rerun_trigger'
  | 'factory_trigger_schedule'
  | 'file_share'
  | 'firewall_application_rule_collection'
  | 'firewall_ip_configuration'
  | 'firewall_nat_rule_collection'
  | 'firewall_network_rule_collection'
  | 'firewall_policy'
  | 'firewall_policy_rule_collection_group'
  | 'firewall_policy_rule_group'
  | 'fleet'
  | 'flexible_server'
  | 'front_door'
  | 'frontdoor_web_application_firewall_policy'
  | 'gallery'
  | 'gallery_application'
  | 'gallery_application_version'
  | 'gallery_image'
  | 'gallery_image_version'
  | 'gateway'
  | 'grafana'
  | 'host_pool'
  | 'hosting_environment'
  | 'hosting_environment_app_service_environment'
  | 'hub'
  | 'hub_authorization_policy'
  | 'hub_connector'
  | 'hub_connector_mapping'
  | 'hub_interaction'
  | 'hub_kpi'
  | 'hub_link'
  | 'hub_prediction'
  | 'hub_profile'
  | 'hub_relationship'
  | 'hub_relationship_link'
  | 'hub_role_assignment'
  | 'hub_view'
  | 'image'
  | 'image_template'
  | 'import_export_job'
  | 'information_protection_policy'
  | 'ingestion_setting'
  | 'integration_account'
  | 'integration_account_assembly'
  | 'integration_account_batch_configuration'
  | 'integration_account_certificate'
  | 'integration_account_map'
  | 'integration_account_partner'
  | 'integration_account_rosettanetprocessconfiguration'
  | 'integration_account_schema'
  | 'integration_account_session'
  | 'integration_service_environment'
  | 'integration_service_environment_managed_api'
  | 'io_t_app'
  | 'iot_hub'
  | 'iot_hub_certificate'
  | 'iot_hub_event_hub_endpoint_consumer_group'
  | 'iot_security_solution'
  | 'ip_group'
  | 'key_vault_certificate'
  | 'key_vault_key'
  | 'key_vault_vault'
  | 'kubernetes_cluster'
  | 'kubernetes_cluster_agent_pool'
  | 'kubernetes_cluster_feature'
  | 'kusto_cluster'
  | 'l2_network'
  | 'l3_network'
  | 'lab_customimage'
  | 'lab_formula'
  | 'lab_services_lab'
  | 'lab_virtualmachine'
  | 'lab_virtualmachine_linux'
  | 'lab_virtualmachine_windows'
  | 'labplan'
  | 'lb_rule'
  | 'ledger'
  | 'load_balancer'
  | 'load_balancer_inbound_nat_rule'
  | 'load_balancer_load_balancer_external'
  | 'load_balancer_load_balancer_internal'
  | 'load_test'
  | 'local_network_gateway'
  | 'location_application_whitelisting'
  | 'location_jit_network_access_policy'
  | 'lock'
  | 'machine'
  | 'machine_learning_registry'
  | 'machine_learning_workspace'
  | 'maintenance_configuration'
  | 'managed_cluster_agent_pool_system'
  | 'managed_cluster_agent_pool_user'
  | 'managed_environment'
  | 'managed_hsm'
  | 'managed_instance'
  | 'management_group'
  | 'manager'
  | 'maps_account'
  | 'mediaservice'
  | 'mediaservice_live_event'
  | 'mediaservice_live_event_live_output'
  | 'mediaservice_streaming_endpoint'
  | 'metric_alert'
  | 'mobile_network'
  | 'mobile_network_data_network'
  | 'mobile_network_service'
  | 'mobile_network_sim_policy'
  | 'mobile_network_site'
  | 'mobile_network_slice'
  | 'monitor_diagnostic_setting'
  | 'monitor_workspace'
  | 'namespace_event_hub'
  | 'namespace_eventhub_authorization_rule'
  | 'namespace_eventhub_consumergroup'
  | 'namespace_hybrid_connection'
  | 'namespace_hybrid_connection_authorization_rule'
  | 'namespace_migration_configuration'
  | 'namespace_notification_hub'
  | 'namespace_notification_hub_authorization_rule'
  | 'namespace_queue'
  | 'namespace_queue_authorization_rule'
  | 'namespace_topic'
  | 'namespace_topic_authorization_rule'
  | 'namespace_topic_subscription'
  | 'namespace_topic_subscription_rule'
  | 'namespace_wcf_relay'
  | 'namespace_wcf_relay_authorization_rule'
  | 'nat_gateway'
  | 'net_app_account'
  | 'net_app_account_backup'
  | 'net_app_account_backup_policy'
  | 'net_app_account_bucket'
  | 'net_app_account_capacity_pool'
  | 'net_app_account_share_name'
  | 'net_app_account_snapshot'
  | 'net_app_account_snapshot_policy'
  | 'net_app_account_volume'
  | 'net_app_account_volume_group'
  | 'network_cloud_cluster'
  | 'network_cloud_virtual_machine'
  | 'network_ddos_protection_plan'
  | 'network_interface'
  | 'network_manager'
  | 'network_security_group'
  | 'network_security_group_security_rule'
  | 'network_security_perimeter'
  | 'network_watcher'
  | 'notification_hubs_namespace'
  | 'notification_hubs_namespace_authorization_rule'
  | 'operational_insights_cluster'
  | 'operational_insights_workspace'
  | 'packet_core_control_plane'
  | 'packet_core_control_plane_packet_core_data_plane'
  | 'packet_core_control_plane_packet_core_data_plane_attached_data_network'
  | 'point_to_site_vpn_gateway'
  | 'policy_assignment'
  | 'policy_definition'
  | 'policy_exemption'
  | 'policy_set_definition'
  | 'pool'
  | 'power_bi_dedicated_capacity'
  | 'pricing'
  | 'private_cloud'
  | 'private_dns_a_record'
  | 'private_dns_aaaa_record'
  | 'private_dns_cname_record'
  | 'private_dns_mx_record'
  | 'private_dns_ptr_record'
  | 'private_dns_srv_record'
  | 'private_dns_txt_record'
  | 'private_dns_zone'
  | 'private_dns_zone_group'
  | 'private_dns_zone_virtual_network_link'
  | 'private_endpoint'
  | 'private_link_hub'
  | 'private_link_scope'
  | 'private_link_service'
  | 'private_link_service_private_endpoint_connection'
  | 'private_service_connection'
  | 'profile_afd_endpoint'
  | 'profile_afd_endpoint_route'
  | 'profile_cdn'
  | 'profile_endpoint'
  | 'profile_front_door_standard_premium'
  | 'profile_origin_group'
  | 'profile_origin_group_origin'
  | 'prometheus_rule_group'
  | 'provisioning_service'
  | 'provisioning_service_certificate'
  | 'proximity_placement_group'
  | 'public_ip_address'
  | 'public_ip_prefix'
  | 'purview_account'
  | 'quantum_workspace'
  | 'querypack'
  | 'queue'
  | 'rack'
  | 'recovery_services_vault'
  | 'redhat_openshift_cluster'
  | 'redis'
  | 'redis_enterprise'
  | 'redis_firewall_rule'
  | 'registration_hub'
  | 'registration_hub_machine'
  | 'registry'
  | 'registry_build_task'
  | 'registry_build_task_step'
  | 'registry_replication'
  | 'registry_scope_map'
  | 'registry_task'
  | 'registry_token'
  | 'registry_webhook'
  | 'relay_namespace'
  | 'relay_namespace_authorization_rule'
  | 'resource_group'
  | 'resource_guard'
  | 'resource_provider'
  | 'restore_point_collection'
  | 'role_assignment'
  | 'role_definition'
  | 'route_filter'
  | 'route_filter_route_filter_rule'
  | 'route_table'
  | 'route_table_route'
  | 'scaling_plan'
  | 'scheduled_query_rule'
  | 'scheduled_query_rule_alert'
  | 'search_service'
  | 'security_contact'
  | 'server_administrator'
  | 'server_database_sync_group'
  | 'server_elastic_pool'
  | 'server_failover_group'
  | 'server_farm'
  | 'server_groupsv2'
  | 'server_job_agent'
  | 'server_key'
  | 'server_vulnerability_assessment'
  | 'service_api'
  | 'service_api_issue'
  | 'service_api_issue_attachment'
  | 'service_api_issue_comment'
  | 'service_api_operation'
  | 'service_api_operation_tag'
  | 'service_api_release'
  | 'service_api_schema'
  | 'service_api_tag'
  | 'service_api_tag_description'
  | 'service_api_version_set'
  | 'service_authorization_server'
  | 'service_backend'
  | 'service_bus_namespace'
  | 'service_bus_namespace_authorization_rule'
  | 'service_bus_namespace_disaster_recovery_config'
  | 'service_certificate'
  | 'service_diagnostic'
  | 'service_end_point_policy'
  | 'service_fabric_cluster'
  | 'service_fabric_managed_cluster'
  | 'service_group'
  | 'service_group_user'
  | 'service_identity_provider'
  | 'service_logger'
  | 'service_notification'
  | 'service_notification_recipient_email'
  | 'service_openid_connect_provider'
  | 'service_policy'
  | 'service_product'
  | 'service_product_api'
  | 'service_product_group'
  | 'service_product_tag'
  | 'service_project'
  | 'service_property'
  | 'service_subscription'
  | 'service_tag'
  | 'service_template'
  | 'service_user'
  | 'setting'
  | 'signal_r'
  | 'sim_group'
  | 'sim_group_sim'
  | 'site_function_app'
  | 'site_private_endpoint_connection'
  | 'site_slot'
  | 'site_web_app'
  | 'snapshot'
  | 'solution'
  | 'spring'
  | 'sql_server'
  | 'sql_server_database'
  | 'sql_server_firewall_rule'
  | 'sql_vulnerability_assessment_baseline_rule'
  | 'ssh_public_key'
  | 'static_site'
  | 'storage_account'
  | 'storage_account_blob_service'
  | 'storage_account_blob_service_container'
  | 'storage_account_blob_service_container_blob_container'
  | 'storage_account_blob_service_container_data_lake_gen2_filesystem'
  | 'storage_account_file_service'
  | 'storage_account_file_service_share'
  | 'storage_account_management_policy'
  | 'storage_account_vm'
  | 'storage_appliance'
  | 'storage_blob'
  | 'storage_queue'
  | 'storage_share_directory'
  | 'storage_sync_service'
  | 'storage_sync_service_sync_group'
  | 'storage_table'
  | 'stream_analytics_cluster'
  | 'streamingjob'
  | 'streamingjob_function'
  | 'streamingjob_function_javascript_udf'
  | 'streamingjob_input'
  | 'streamingjob_input_reference_blob'
  | 'streamingjob_input_stream_blob'
  | 'streamingjob_input_stream_event_hub'
  | 'streamingjob_input_stream_iot_hub'
  | 'streamingjob_output'
  | 'streamingjob_output_blob'
  | 'streamingjob_output_event_hub'
  | 'streamingjob_output_service_bus_queue'
  | 'streamingjob_output_service_bus_topic'
  | 'streamingjob_output_sql_database'
  | 'streamingjob_transformation'
  | 'synapse_workspace'
  | 'system_topic'
  | 'table'
  | 'tag_name'
  | 'tag_name_tag_value'
  | 'template_spec'
  | 'topic'
  | 'traffic_manager_profile'
  | 'trunked_network'
  | 'user_assigned_identity'
  | 'vault_backup_policy'
  | 'vault_backup_policy_virtual_machine'
  | 'vault_secret'
  | 'video_indexer_account'
  | 'virtual_enclave'
  | 'virtual_enclave_enclave_endpoint'
  | 'virtual_enclave_workload'
  | 'virtual_hub_route_server'
  | 'virtual_hub_virtual_wan_hub'
  | 'virtual_machine_console'
  | 'virtual_machine_extension'
  | 'virtual_machine_scale_set'
  | 'virtual_machine_scale_set_extension'
  | 'virtual_machine_windows'
  | 'virtual_network'
  | 'virtual_network_gateway'
  | 'virtual_network_gateway_express_route_gateway'
  | 'virtual_network_subnet'
  | 'virtual_network_virtual_network_peering'
  | 'virtual_wan'
  | 'volume'
  | 'vpn_gateway'
  | 'vpn_gateway_vpn_connection'
  | 'vpn_site'
  | 'web_pub_sub'
  | 'web_service'
  | 'workflow'
  | 'workspace_big_data_pool'
  | 'workspace_collection'
  | 'workspace_compute'
  | 'workspace_datastore'
  | 'workspace_hub'
  | 'workspace_machine_learning'
  | 'workspace_project'
  | 'workspace_sql_pool'

@description('Naming rules per resource type: `slug` is the Cloud Adoption Framework abbreviation, `max` the maximum allowed name length, `dashes` whether hyphens are allowed in the name, `lowercase` whether the name must be lower case. Rules sourced from the Azure Verified Naming Utility catalog (https://github.com/Azure/terraform-azure-avm-utl-naming) and the Azure resource naming rules (https://learn.microsoft.com/azure/azure-resource-manager/management/resource-name-rules).')
var nameRules = {
  access_connector: {
    slug: 'dbac'
    max: 30
    dashes: false
    lowercase: true
  }
  account_ai_services: {
    slug: 'aif'
    max: 64
    dashes: true
    lowercase: false
  }
  account_cognitive_services: {
    slug: 'ais'
    max: 64
    dashes: true
    lowercase: false
  }
  account_compute_policy: {
    slug: 'account-compute-policy'
    max: 60
    dashes: true
    lowercase: false
  }
  account_computer_vision: {
    slug: 'cv'
    max: 64
    dashes: true
    lowercase: false
  }
  account_content_moderator: {
    slug: 'cm'
    max: 64
    dashes: true
    lowercase: false
  }
  account_content_safety: {
    slug: 'cs'
    max: 64
    dashes: true
    lowercase: false
  }
  account_custom_vision_prediction: {
    slug: 'cstv'
    max: 64
    dashes: true
    lowercase: false
  }
  account_custom_vision_training: {
    slug: 'cstvt'
    max: 64
    dashes: true
    lowercase: false
  }
  account_data_lake_store_account: {
    slug: 'dlslink'
    max: 24
    dashes: false
    lowercase: true
  }
  account_face: {
    slug: 'face'
    max: 64
    dashes: true
    lowercase: false
  }
  account_form_recognizer: {
    slug: 'di'
    max: 64
    dashes: true
    lowercase: false
  }
  account_health_insights: {
    slug: 'hi'
    max: 64
    dashes: true
    lowercase: false
  }
  account_immersive_reader: {
    slug: 'ir'
    max: 64
    dashes: true
    lowercase: false
  }
  account_open_ai: {
    slug: 'oai'
    max: 64
    dashes: true
    lowercase: false
  }
  account_project: {
    slug: 'proj'
    dashes: false
    lowercase: true
  }
  account_speech_services: {
    slug: 'spch'
    max: 64
    dashes: true
    lowercase: false
  }
  account_storage_account: {
    slug: 'account-storage-account'
    max: 60
    dashes: true
    lowercase: false
  }
  account_text_analytics: {
    slug: 'lang'
    max: 64
    dashes: true
    lowercase: false
  }
  account_text_translation: {
    slug: 'trsl'
    max: 64
    dashes: true
    lowercase: false
  }
  account_virtual_network_rule: {
    slug: 'account-virtual-network-rule'
    max: 50
    dashes: true
    lowercase: false
  }
  action_group: {
    slug: 'ag'
    max: 260
    dashes: false
    lowercase: true
  }
  action_rule: {
    slug: 'apr'
    max: 260
    dashes: false
    lowercase: true
  }
  activity_log_alert: {
    slug: 'activitylogalert'
    max: 260
    dashes: false
    lowercase: true
  }
  advanced_threat_protection_setting: {
    slug: 'advancedthreatprotectionsetting'
    dashes: false
    lowercase: true
  }
  alerts_suppression_rule: {
    slug: 'alerts-suppression-rule'
    max: 260
    dashes: true
    lowercase: false
  }
  analysis_services_server: {
    slug: 'as'
    max: 63
    dashes: false
    lowercase: true
  }
  api_management_service: {
    slug: 'apim'
    max: 50
    dashes: true
    lowercase: false
  }
  app_job: {
    slug: 'caj'
    max: 32
    dashes: false
    lowercase: true
  }
  application_gateway: {
    slug: 'agw'
    max: 80
    dashes: true
    lowercase: false
  }
  application_gateway_web_application_firewall_policy: {
    slug: 'waf'
    max: 80
    dashes: false
    lowercase: true
  }
  application_group: {
    slug: 'vdag'
    max: 64
    dashes: true
    lowercase: false
  }
  application_security_group: {
    slug: 'asg'
    max: 80
    dashes: true
    lowercase: false
  }
  assessment: {
    slug: 'assessment'
    max: 260
    dashes: true
    lowercase: false
  }
  assessment_metadata: {
    slug: 'assessment-metadata'
    max: 260
    dashes: true
    lowercase: false
  }
  assessment_project: {
    slug: 'migr'
    dashes: false
    lowercase: true
  }
  association: {
    slug: 'association'
    max: 180
    dashes: false
    lowercase: true
  }
  auto_provisioning_setting: {
    slug: 'auto-provisioning-setting'
    max: 260
    dashes: true
    lowercase: false
  }
  auto_scale_setting: {
    slug: 'mas'
    max: 260
    dashes: false
    lowercase: true
  }
  automation: {
    slug: 'automation'
    max: 260
    dashes: true
    lowercase: false
  }
  automation_account: {
    slug: 'aa'
    max: 50
    dashes: true
    lowercase: false
  }
  automation_account_certificate: {
    slug: 'aacert'
    max: 128
    dashes: false
    lowercase: true
  }
  automation_account_connection: {
    slug: 'automationaccountconnection'
    max: 128
    dashes: false
    lowercase: true
  }
  automation_account_credential: {
    slug: 'aacred'
    max: 128
    dashes: false
    lowercase: true
  }
  automation_account_runbook: {
    slug: 'aarb'
    max: 63
    dashes: true
    lowercase: false
  }
  automation_account_schedule: {
    slug: 'aasched'
    max: 128
    dashes: false
    lowercase: true
  }
  automation_account_variable: {
    slug: 'aavar'
    max: 128
    dashes: false
    lowercase: true
  }
  automation_account_watcher: {
    slug: 'automation-account-watcher'
    max: 63
    dashes: true
    lowercase: false
  }
  automation_account_webhook: {
    slug: 'automationaccountwebhook'
    max: 128
    dashes: false
    lowercase: true
  }
  availability_set: {
    slug: 'avail'
    max: 80
    dashes: true
    lowercase: false
  }
  azure_firewall: {
    slug: 'afw'
    max: 80
    dashes: true
    lowercase: false
  }
  backup_vault: {
    slug: 'bvault'
    max: 50
    dashes: true
    lowercase: false
  }
  backup_vault_backup_policy: {
    slug: 'bkpol'
    max: 75
    dashes: true
    lowercase: false
  }
  backupvault_backup_instance: {
    slug: 'backupvault-backup-instance'
    max: 75
    dashes: true
    lowercase: false
  }
  bare_metal_machine: {
    slug: 'baremetalmachine'
    max: 64
    dashes: false
    lowercase: false
  }
  bare_metal_machine_key_set: {
    slug: 'bare-metal-machine-key-set'
    max: 30
    dashes: true
    lowercase: false
  }
  bastion_host: {
    slug: 'bas'
    max: 80
    dashes: true
    lowercase: false
  }
  batch_account: {
    slug: 'ba'
    max: 24
    dashes: false
    lowercase: true
  }
  batch_account_application: {
    slug: 'baapp'
    max: 64
    dashes: true
    lowercase: false
  }
  batch_account_certificate: {
    slug: 'bacert'
    max: 45
    dashes: true
    lowercase: false
  }
  batch_account_pool: {
    slug: 'bapool'
    max: 64
    dashes: true
    lowercase: false
  }
  blob: {
    slug: 'blob'
    max: 1024
    dashes: false
    lowercase: true
  }
  blockchain_member: {
    slug: 'blockchainmember'
    max: 20
    dashes: false
    lowercase: true
  }
  blueprint: {
    slug: 'blueprint'
    max: 90
    dashes: true
    lowercase: false
  }
  blueprint_assignment: {
    slug: 'blueprint-assignment'
    max: 90
    dashes: true
    lowercase: false
  }
  bmc_key_set: {
    slug: 'bmc-key-set'
    max: 30
    dashes: true
    lowercase: false
  }
  bot_service_azurebot: {
    slug: 'bot'
    max: 64
    dashes: true
    lowercase: false
  }
  bot_service_channel: {
    slug: 'bot-service-channel'
    max: 64
    dashes: true
    lowercase: false
  }
  bot_service_channel_direct_line: {
    slug: 'botline'
    max: 64
    dashes: true
    lowercase: false
  }
  bot_service_channel_email: {
    slug: 'botmail'
    max: 64
    dashes: true
    lowercase: false
  }
  bot_service_channel_ms_teams: {
    slug: 'botteams'
    max: 64
    dashes: true
    lowercase: false
  }
  bot_service_channel_slack: {
    slug: 'botslack'
    max: 64
    dashes: true
    lowercase: false
  }
  bot_service_channels_registration: {
    slug: 'botchan'
    max: 64
    dashes: true
    lowercase: false
  }
  bot_service_connection: {
    slug: 'botcon'
    max: 64
    dashes: true
    lowercase: false
  }
  budget: {
    slug: 'budget'
    max: 63
    dashes: true
    lowercase: false
  }
  certificate: {
    slug: 'certificate'
    max: 260
    dashes: false
    lowercase: true
  }
  certificate_order: {
    slug: 'certificateorder'
    max: 50
    dashes: false
    lowercase: false
  }
  cloud_service: {
    slug: 'cld'
    dashes: false
    lowercase: true
  }
  cloud_services_network: {
    slug: 'cloud-services-network'
    max: 30
    dashes: true
    lowercase: false
  }
  cluster_database: {
    slug: 'dedb'
    max: 260
    dashes: true
    lowercase: false
  }
  cluster_database_data_connection: {
    slug: 'cluster-database-data-connection'
    max: 40
    dashes: true
    lowercase: false
  }
  cluster_database_data_connection_event_hub: {
    slug: 'kehc'
    max: 40
    dashes: true
    lowercase: false
  }
  cluster_database_eventhubconnection: {
    slug: 'cluster-database-eventhubconnection'
    max: 40
    dashes: true
    lowercase: false
  }
  cluster_h_base: {
    slug: 'hbase'
    max: 59
    dashes: true
    lowercase: false
  }
  cluster_hadoop: {
    slug: 'hadoop'
    max: 59
    dashes: true
    lowercase: false
  }
  cluster_interactive_query: {
    slug: 'iqr'
    max: 59
    dashes: true
    lowercase: false
  }
  cluster_kafka: {
    slug: 'kafka'
    max: 59
    dashes: true
    lowercase: false
  }
  cluster_manager: {
    slug: 'cluster-manager'
    max: 30
    dashes: true
    lowercase: false
  }
  cluster_metrics_configuration: {
    slug: 'clustermetricsconfiguration'
    dashes: false
    lowercase: true
  }
  cluster_ml_services: {
    slug: 'mls'
    max: 59
    dashes: true
    lowercase: false
  }
  cluster_rserver: {
    slug: 'rsv'
    max: 59
    dashes: true
    lowercase: false
  }
  cluster_spark: {
    slug: 'spark'
    max: 59
    dashes: true
    lowercase: false
  }
  cluster_storm: {
    slug: 'storm'
    max: 59
    dashes: true
    lowercase: false
  }
  cognitive_services_account: {
    slug: 'cog'
    max: 64
    dashes: true
    lowercase: false
  }
  commitment_plan: {
    slug: 'commitmentplan'
    max: 260
    dashes: false
    lowercase: true
  }
  communication_service: {
    slug: 'acs'
    max: 63
    dashes: true
    lowercase: false
  }
  community: {
    slug: 'cmt'
    dashes: false
    lowercase: true
  }
  community_community_endpoint: {
    slug: 'ce'
    dashes: false
    lowercase: true
  }
  community_dedicated_hub: {
    slug: 'dh'
    dashes: false
    lowercase: true
  }
  community_transit_hub: {
    slug: 'th'
    dashes: false
    lowercase: true
  }
  component: {
    slug: 'appi'
    max: 260
    dashes: false
    lowercase: true
  }
  compute_virtual_machine: {
    slug: 'vm'
    max: 64
    dashes: true
    lowercase: false
  }
  configuration_store: {
    slug: 'appcs'
    max: 50
    dashes: true
    lowercase: false
  }
  configuration_store_replica: {
    slug: 'configurationstorereplica'
    dashes: false
    lowercase: true
  }
  connected_cluster: {
    slug: 'arck'
    dashes: false
    lowercase: true
  }
  connection: {
    slug: 'con'
    max: 80
    dashes: true
    lowercase: false
  }
  connector: {
    slug: 'connector'
    max: 260
    dashes: true
    lowercase: false
  }
  container_app: {
    slug: 'ca'
    max: 32
    dashes: true
    lowercase: true
  }
  container_group: {
    slug: 'ci'
    max: 63
    dashes: true
    lowercase: true
  }
  container_service_managed_cluster: {
    slug: 'aks'
    max: 63
    dashes: true
    lowercase: false
  }
  cosmosdb_cassandra_cluster: {
    slug: 'mcc'
    max: 44
    dashes: true
    lowercase: false
  }
  cosmosdb_cassandra_datacenter: {
    slug: 'mcdc'
    max: 44
    dashes: true
    lowercase: false
  }
  dashboard: {
    slug: 'dsb'
    max: 160
    dashes: true
    lowercase: false
  }
  data_box_job: {
    slug: 'data-box-job'
    max: 24
    dashes: true
    lowercase: false
  }
  data_collection_endpoint: {
    slug: 'dce'
    max: 64
    dashes: false
    lowercase: true
  }
  data_collection_rule: {
    slug: 'dcr'
    max: 64
    dashes: false
    lowercase: true
  }
  data_collection_rule_association: {
    slug: 'dcra'
    dashes: false
    lowercase: true
  }
  data_lake_analytics_account: {
    slug: 'dla'
    max: 24
    dashes: false
    lowercase: true
  }
  data_lake_analytics_account_firewall_rule: {
    slug: 'dlfw'
    max: 50
    dashes: true
    lowercase: false
  }
  data_lake_store_account: {
    slug: 'dls'
    max: 24
    dashes: false
    lowercase: true
  }
  data_lake_store_account_firewall_rule: {
    slug: 'dlsfw'
    max: 50
    dashes: true
    lowercase: false
  }
  data_migration_service: {
    slug: 'dms'
    max: 62
    dashes: true
    lowercase: false
  }
  database_account: {
    slug: 'cosmos'
    max: 44
    dashes: true
    lowercase: true
  }
  database_account_cosmos_db_for_apache_cassandra_account: {
    slug: 'coscas'
    max: 44
    dashes: true
    lowercase: true
  }
  database_account_cosmos_db_for_apache_gremlin_account: {
    slug: 'cosgrm'
    max: 44
    dashes: true
    lowercase: true
  }
  database_account_cosmos_db_for_mongo_db_account: {
    slug: 'cosmon'
    max: 44
    dashes: true
    lowercase: true
  }
  database_account_cosmos_db_for_no_sql_account: {
    slug: 'cosno'
    max: 44
    dashes: true
    lowercase: true
  }
  database_account_cosmos_db_for_table_account: {
    slug: 'costab'
    max: 44
    dashes: true
    lowercase: true
  }
  database_account_sql_database: {
    slug: 'cosmos'
    dashes: false
    lowercase: true
  }
  databricks_cluster: {
    slug: 'dbc'
    max: 30
    dashes: true
    lowercase: false
  }
  databricks_high_concurrency_cluster: {
    slug: 'dbhcc'
    max: 30
    dashes: true
    lowercase: false
  }
  databricks_standard_cluster: {
    slug: 'dbsc'
    max: 30
    dashes: true
    lowercase: false
  }
  databricks_workspace: {
    slug: 'dbw'
    max: 64
    dashes: true
    lowercase: false
  }
  db_for_maria_db_server: {
    slug: 'maria'
    max: 63
    dashes: true
    lowercase: true
  }
  db_for_maria_db_server_database: {
    slug: 'mariadb'
    max: 63
    dashes: true
    lowercase: false
  }
  db_for_maria_db_server_firewall_rule: {
    slug: 'mariafw'
    max: 128
    dashes: true
    lowercase: false
  }
  db_for_maria_db_server_virtual_network_rule: {
    slug: 'mariavn'
    max: 128
    dashes: true
    lowercase: false
  }
  db_for_my_sql_server: {
    slug: 'mysql'
    max: 63
    dashes: true
    lowercase: true
  }
  db_for_my_sql_server_database: {
    slug: 'mysqldb'
    max: 63
    dashes: true
    lowercase: false
  }
  db_for_my_sql_server_firewall_rule: {
    slug: 'mysqlfw'
    max: 128
    dashes: true
    lowercase: false
  }
  db_for_my_sql_server_virtual_network_rule: {
    slug: 'mysqlvn'
    max: 128
    dashes: true
    lowercase: false
  }
  db_for_postgre_sql_server: {
    slug: 'psql'
    max: 63
    dashes: true
    lowercase: true
  }
  db_for_postgre_sql_server_database: {
    slug: 'psqldb'
    max: 63
    dashes: true
    lowercase: false
  }
  db_for_postgre_sql_server_firewall_rule: {
    slug: 'psqlfw'
    max: 128
    dashes: true
    lowercase: false
  }
  db_for_postgre_sql_server_virtual_network_rule: {
    slug: 'psqlvn'
    max: 128
    dashes: true
    lowercase: false
  }
  deployment: {
    slug: 'ts'
    max: 64
    dashes: true
    lowercase: false
  }
  deployment_script: {
    slug: 'script'
    dashes: false
    lowercase: true
  }
  deployment_template_deployment: {
    slug: 'deploy'
    max: 64
    dashes: true
    lowercase: false
  }
  desktop_virtualization_workspace: {
    slug: 'vdws'
    max: 64
    dashes: true
    lowercase: false
  }
  dev_test_lab_lab: {
    slug: 'lab'
    max: 50
    dashes: true
    lowercase: false
  }
  device_security_group: {
    slug: 'device-security-group'
    max: 260
    dashes: true
    lowercase: false
  }
  digital_twins_instance: {
    slug: 'dt'
    dashes: false
    lowercase: true
  }
  disk: {
    slug: 'dsk'
    max: 80
    dashes: true
    lowercase: false
  }
  disk_access: {
    slug: 'da'
    max: 80
    dashes: true
    lowercase: false
  }
  disk_encryption_set: {
    slug: 'des'
    max: 80
    dashes: true
    lowercase: false
  }
  disk_managed_disk_data: {
    slug: 'disk'
    max: 80
    dashes: true
    lowercase: false
  }
  disk_managed_disk_o: {
    slug: 'osdisk'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_a_record: {
    slug: 'dnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_aaaa_record: {
    slug: 'dnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_caa_record: {
    slug: 'dnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_cname_record: {
    slug: 'dnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_forwarding_ruleset: {
    slug: 'dnsfrs'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_mx_record: {
    slug: 'dnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_ns_record: {
    slug: 'dnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_ptr_record: {
    slug: 'dnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_resolver: {
    slug: 'dnspr'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_resolver_inbound_endpoint: {
    slug: 'in'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_resolver_outbound_endpoint: {
    slug: 'out'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_txt_record: {
    slug: 'dnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  dns_zone: {
    slug: 'dns'
    max: 63
    dashes: false
    lowercase: true
  }
  domain: {
    slug: 'evgd'
    max: 50
    dashes: true
    lowercase: false
  }
  domain_topic: {
    slug: 'evgt'
    max: 50
    dashes: true
    lowercase: false
  }
  edge_cluster: {
    slug: 'edge-cluster'
    max: 30
    dashes: true
    lowercase: false
  }
  edge_cluster_node: {
    slug: 'edgeclusternode'
    max: 64
    dashes: false
    lowercase: false
  }
  elastic_san: {
    slug: 'elastic-san'
    max: 24
    dashes: true
    lowercase: true
  }
  elastic_san_volume_group: {
    slug: 'elastic-san-volume-group'
    max: 63
    dashes: true
    lowercase: true
  }
  enclave_connection: {
    slug: 'ec'
    dashes: false
    lowercase: true
  }
  enterprise_channel: {
    slug: 'enterprise-channel'
    max: 64
    dashes: true
    lowercase: false
  }
  environment: {
    slug: 'tsi'
    max: 90
    dashes: false
    lowercase: true
  }
  environment_access_policy: {
    slug: 'environmentaccesspolicy'
    max: 90
    dashes: false
    lowercase: true
  }
  environment_event_source: {
    slug: 'environmenteventsource'
    max: 90
    dashes: false
    lowercase: true
  }
  environment_reference_data_set: {
    slug: 'environmentreferencedataset'
    max: 63
    dashes: false
    lowercase: false
  }
  event_grid_namespace: {
    slug: 'evgns'
    max: 50
    dashes: false
    lowercase: true
  }
  event_hub_cluster: {
    slug: 'evhcl'
    max: 50
    dashes: true
    lowercase: false
  }
  event_hub_namespace: {
    slug: 'evhns'
    max: 50
    dashes: true
    lowercase: false
  }
  event_hub_namespace_authorization_rule: {
    slug: 'ehnar'
    max: 50
    dashes: true
    lowercase: false
  }
  event_hub_namespace_disaster_recovery_config: {
    slug: 'ehdr'
    max: 50
    dashes: true
    lowercase: false
  }
  event_subscription: {
    slug: 'evgs'
    max: 64
    dashes: true
    lowercase: false
  }
  express_route_circuit: {
    slug: 'erc'
    max: 80
    dashes: true
    lowercase: false
  }
  express_route_gateway: {
    slug: 'ergw'
    max: 80
    dashes: true
    lowercase: false
  }
  express_route_port: {
    slug: 'erd'
    dashes: false
    lowercase: true
  }
  fabric_capacity: {
    slug: 'fc'
    max: 63
    dashes: false
    lowercase: true
  }
  factory: {
    slug: 'adf'
    max: 63
    dashes: true
    lowercase: false
  }
  factory_dataflow: {
    slug: 'factorydataflow'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_dataset: {
    slug: 'factorydataset'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_dataset_mysql_table: {
    slug: 'adfmysql'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_dataset_postgresql_table: {
    slug: 'adfpsql'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_dataset_sql_server_table: {
    slug: 'adfmssql'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_integration_runtime: {
    slug: 'factory-integration-runtime'
    max: 63
    dashes: true
    lowercase: false
  }
  factory_integration_runtime_azure_ssis: {
    slug: 'adfir'
    max: 63
    dashes: true
    lowercase: false
  }
  factory_linkedservice: {
    slug: 'factorylinkedservice'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_linkedservice_data_lake_storage_gen2: {
    slug: 'adfsvst'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_linkedservice_key_vault: {
    slug: 'adfsvkv'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_linkedservice_mysql: {
    slug: 'adfsvmysql'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_linkedservice_postgresql: {
    slug: 'adfsvpsql'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_linkedservice_sql_server: {
    slug: 'adfsvmssql'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_pipeline: {
    slug: 'adfpl'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_trigger: {
    slug: 'factorytrigger'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_trigger_rerun_trigger: {
    slug: 'factorytriggerreruntrigger'
    max: 260
    dashes: false
    lowercase: true
  }
  factory_trigger_schedule: {
    slug: 'adftg'
    max: 260
    dashes: false
    lowercase: true
  }
  file_share: {
    slug: 'file-share'
    max: 63
    dashes: true
    lowercase: true
  }
  firewall_application_rule_collection: {
    slug: 'fwapprc'
    max: 80
    dashes: true
    lowercase: false
  }
  firewall_ip_configuration: {
    slug: 'fwipconf'
    max: 80
    dashes: true
    lowercase: false
  }
  firewall_nat_rule_collection: {
    slug: 'fwnatrc'
    max: 80
    dashes: true
    lowercase: false
  }
  firewall_network_rule_collection: {
    slug: 'fwnetrc'
    max: 80
    dashes: true
    lowercase: false
  }
  firewall_policy: {
    slug: 'afwp'
    max: 80
    dashes: true
    lowercase: false
  }
  firewall_policy_rule_collection_group: {
    slug: 'fwprcg'
    max: 80
    dashes: true
    lowercase: false
  }
  firewall_policy_rule_group: {
    slug: 'wafrg'
    max: 80
    dashes: true
    lowercase: false
  }
  fleet: {
    slug: 'fleet'
    dashes: false
    lowercase: true
  }
  flexible_server: {
    slug: 'pgsql'
    dashes: false
    lowercase: true
  }
  front_door: {
    slug: 'afd'
    max: 64
    dashes: true
    lowercase: false
  }
  frontdoor_web_application_firewall_policy: {
    slug: 'fdfp'
    max: 128
    dashes: false
    lowercase: false
  }
  gallery: {
    slug: 'gal'
    max: 80
    dashes: false
    lowercase: false
  }
  gallery_application: {
    slug: 'gallery-application'
    max: 80
    dashes: true
    lowercase: false
  }
  gallery_application_version: {
    slug: 'galleryapplicationversion'
    dashes: false
    lowercase: true
  }
  gallery_image: {
    slug: 'si'
    max: 80
    dashes: true
    lowercase: false
  }
  gallery_image_version: {
    slug: 'galleryimageversion'
    dashes: false
    lowercase: true
  }
  gateway: {
    slug: 'arcgw'
    dashes: false
    lowercase: true
  }
  grafana: {
    slug: 'amg'
    max: 80
    dashes: false
    lowercase: true
  }
  host_pool: {
    slug: 'vdpool'
    max: 64
    dashes: true
    lowercase: false
  }
  hosting_environment: {
    slug: 'host'
    max: 35
    dashes: false
    lowercase: true
  }
  hosting_environment_app_service_environment: {
    slug: 'ase'
    max: 35
    dashes: false
    lowercase: true
  }
  hub: {
    slug: 'hub'
    max: 64
    dashes: false
    lowercase: false
  }
  hub_authorization_policy: {
    slug: 'hubauthorizationpolicy'
    max: 50
    dashes: false
    lowercase: false
  }
  hub_connector: {
    slug: 'hubconnector'
    max: 128
    dashes: false
    lowercase: false
  }
  hub_connector_mapping: {
    slug: 'hubconnectormapping'
    max: 128
    dashes: false
    lowercase: false
  }
  hub_interaction: {
    slug: 'hubinteraction'
    max: 128
    dashes: false
    lowercase: false
  }
  hub_kpi: {
    slug: 'hubkpi'
    max: 512
    dashes: false
    lowercase: false
  }
  hub_link: {
    slug: 'hublink'
    max: 512
    dashes: false
    lowercase: false
  }
  hub_prediction: {
    slug: 'hubprediction'
    max: 512
    dashes: false
    lowercase: false
  }
  hub_profile: {
    slug: 'hubprofile'
    max: 128
    dashes: false
    lowercase: false
  }
  hub_relationship: {
    slug: 'hubrelationship'
    max: 512
    dashes: false
    lowercase: false
  }
  hub_relationship_link: {
    slug: 'hubrelationshiplink'
    max: 512
    dashes: false
    lowercase: false
  }
  hub_role_assignment: {
    slug: 'hubroleassignment'
    max: 128
    dashes: false
    lowercase: false
  }
  hub_view: {
    slug: 'hubview'
    max: 512
    dashes: false
    lowercase: false
  }
  image: {
    slug: 'img'
    max: 80
    dashes: true
    lowercase: false
  }
  image_template: {
    slug: 'it'
    dashes: false
    lowercase: true
  }
  import_export_job: {
    slug: 'import-export-job'
    max: 64
    dashes: true
    lowercase: false
  }
  information_protection_policy: {
    slug: 'informationprotectionpolicy'
    dashes: false
    lowercase: true
  }
  ingestion_setting: {
    slug: 'ingestion-setting'
    max: 260
    dashes: true
    lowercase: false
  }
  integration_account: {
    slug: 'ia'
    max: 80
    dashes: true
    lowercase: false
  }
  integration_account_assembly: {
    slug: 'integration-account-assembly'
    max: 80
    dashes: true
    lowercase: false
  }
  integration_account_batch_configuration: {
    slug: 'batch'
    max: 20
    dashes: false
    lowercase: false
  }
  integration_account_certificate: {
    slug: 'integration-account-certificate'
    max: 80
    dashes: true
    lowercase: false
  }
  integration_account_map: {
    slug: 'integration-account-map'
    max: 80
    dashes: true
    lowercase: false
  }
  integration_account_partner: {
    slug: 'integration-account-partner'
    max: 80
    dashes: true
    lowercase: false
  }
  integration_account_rosettanetprocessconfiguration: {
    slug: 'integration-account-rosettanetprocessconfiguration'
    max: 80
    dashes: true
    lowercase: false
  }
  integration_account_schema: {
    slug: 'integration-account-schema'
    max: 80
    dashes: true
    lowercase: false
  }
  integration_account_session: {
    slug: 'integration-account-session'
    max: 80
    dashes: true
    lowercase: false
  }
  integration_service_environment: {
    slug: 'integration-service-environment'
    max: 80
    dashes: true
    lowercase: false
  }
  integration_service_environment_managed_api: {
    slug: 'integration-service-environment-managed-api'
    max: 80
    dashes: true
    lowercase: false
  }
  io_t_app: {
    slug: 'iotapp'
    max: 63
    dashes: true
    lowercase: true
  }
  iot_hub: {
    slug: 'iot'
    max: 50
    dashes: true
    lowercase: false
  }
  iot_hub_certificate: {
    slug: 'iot-hub-certificate'
    max: 64
    dashes: true
    lowercase: false
  }
  iot_hub_event_hub_endpoint_consumer_group: {
    slug: 'iotcg'
    max: 50
    dashes: true
    lowercase: false
  }
  iot_security_solution: {
    slug: 'iot-security-solution'
    max: 260
    dashes: true
    lowercase: false
  }
  ip_group: {
    slug: 'ipg'
    max: 80
    dashes: false
    lowercase: true
  }
  key_vault_certificate: {
    slug: 'kvc'
    max: 127
    dashes: true
    lowercase: false
  }
  key_vault_key: {
    slug: 'kvk'
    max: 127
    dashes: true
    lowercase: false
  }
  key_vault_vault: {
    slug: 'kv'
    max: 24
    dashes: true
    lowercase: false
  }
  kubernetes_cluster: {
    slug: 'kubernetes-cluster'
    max: 30
    dashes: true
    lowercase: false
  }
  kubernetes_cluster_agent_pool: {
    slug: 'kubernetes-cluster-agent-pool'
    max: 30
    dashes: true
    lowercase: false
  }
  kubernetes_cluster_feature: {
    slug: 'kubernetes-cluster-feature'
    max: 63
    dashes: true
    lowercase: false
  }
  kusto_cluster: {
    slug: 'dec'
    max: 22
    dashes: false
    lowercase: true
  }
  l2_network: {
    slug: 'l2-network'
    max: 30
    dashes: true
    lowercase: false
  }
  l3_network: {
    slug: 'l3-network'
    max: 30
    dashes: true
    lowercase: false
  }
  lab_customimage: {
    slug: 'lab-customimage'
    max: 80
    dashes: true
    lowercase: false
  }
  lab_formula: {
    slug: 'lab-formula'
    max: 80
    dashes: true
    lowercase: false
  }
  lab_services_lab: {
    slug: 'lab-services-lab'
    max: 100
    dashes: true
    lowercase: false
  }
  lab_virtualmachine: {
    slug: 'lab-virtualmachine'
    dashes: true
    lowercase: false
  }
  lab_virtualmachine_linux: {
    slug: 'labvm'
    max: 64
    dashes: true
    lowercase: false
  }
  lab_virtualmachine_windows: {
    slug: 'labvm'
    max: 15
    dashes: true
    lowercase: false
  }
  labplan: {
    slug: 'labplan'
    max: 100
    dashes: true
    lowercase: false
  }
  lb_rule: {
    slug: 'rule'
    max: 80
    dashes: true
    lowercase: false
  }
  ledger: {
    slug: 'ledger'
    max: 32
    dashes: true
    lowercase: false
  }
  load_balancer: {
    slug: 'lb'
    max: 80
    dashes: true
    lowercase: false
  }
  load_balancer_inbound_nat_rule: {
    slug: 'rule'
    max: 80
    dashes: true
    lowercase: false
  }
  load_balancer_load_balancer_external: {
    slug: 'lbe'
    max: 80
    dashes: true
    lowercase: false
  }
  load_balancer_load_balancer_internal: {
    slug: 'lbi'
    max: 80
    dashes: true
    lowercase: false
  }
  load_test: {
    slug: 'lt'
    max: 64
    dashes: false
    lowercase: true
  }
  local_network_gateway: {
    slug: 'lgw'
    max: 80
    dashes: true
    lowercase: false
  }
  location_application_whitelisting: {
    slug: 'location-application-whitelisting'
    max: 260
    dashes: true
    lowercase: false
  }
  location_jit_network_access_policy: {
    slug: 'location-jit-network-access-policy'
    max: 260
    dashes: true
    lowercase: false
  }
  lock: {
    slug: 'lock'
    max: 90
    dashes: true
    lowercase: false
  }
  machine: {
    slug: 'arcs'
    dashes: false
    lowercase: true
  }
  machine_learning_registry: {
    slug: 'mlr'
    max: 33
    dashes: true
    lowercase: false
  }
  machine_learning_workspace: {
    slug: 'machinelearningworkspace'
    max: 260
    dashes: false
    lowercase: true
  }
  maintenance_configuration: {
    slug: 'mc'
    max: 80
    dashes: false
    lowercase: true
  }
  managed_cluster_agent_pool_system: {
    slug: 'npsystem'
    dashes: false
    lowercase: true
  }
  managed_cluster_agent_pool_user: {
    slug: 'np'
    dashes: false
    lowercase: true
  }
  managed_environment: {
    slug: 'cae'
    max: 60
    dashes: false
    lowercase: true
  }
  managed_hsm: {
    slug: 'kvmhsm'
    dashes: false
    lowercase: true
  }
  managed_instance: {
    slug: 'sqlmi'
    max: 63
    dashes: true
    lowercase: true
  }
  management_group: {
    slug: 'mg'
    max: 90
    dashes: true
    lowercase: false
  }
  manager: {
    slug: 'manager'
    max: 50
    dashes: true
    lowercase: false
  }
  maps_account: {
    slug: 'map'
    max: 98
    dashes: true
    lowercase: false
  }
  mediaservice: {
    slug: 'mediaservice'
    max: 24
    dashes: false
    lowercase: true
  }
  mediaservice_live_event: {
    slug: 'mediaservice-live-event'
    max: 32
    dashes: true
    lowercase: false
  }
  mediaservice_live_event_live_output: {
    slug: 'mediaservice-live-event-live-output'
    max: 256
    dashes: true
    lowercase: false
  }
  mediaservice_streaming_endpoint: {
    slug: 'stream'
    max: 24
    dashes: true
    lowercase: false
  }
  metric_alert: {
    slug: 'metricalert'
    max: 260
    dashes: false
    lowercase: true
  }
  mobile_network: {
    slug: 'mobile-network'
    max: 64
    dashes: true
    lowercase: false
  }
  mobile_network_data_network: {
    slug: 'mobile-network-data-network'
    max: 64
    dashes: true
    lowercase: false
  }
  mobile_network_service: {
    slug: 'mobile-network-service'
    max: 64
    dashes: true
    lowercase: false
  }
  mobile_network_sim_policy: {
    slug: 'mobile-network-sim-policy'
    max: 64
    dashes: true
    lowercase: false
  }
  mobile_network_site: {
    slug: 'mobile-network-site'
    max: 64
    dashes: true
    lowercase: false
  }
  mobile_network_slice: {
    slug: 'mobile-network-slice'
    max: 64
    dashes: true
    lowercase: false
  }
  monitor_diagnostic_setting: {
    slug: 'mds'
    max: 260
    dashes: true
    lowercase: false
  }
  monitor_workspace: {
    slug: 'amw'
    dashes: true
    lowercase: false
  }
  namespace_event_hub: {
    slug: 'evh'
    max: 256
    dashes: true
    lowercase: false
  }
  namespace_eventhub_authorization_rule: {
    slug: 'ehar'
    max: 50
    dashes: true
    lowercase: false
  }
  namespace_eventhub_consumergroup: {
    slug: 'evhcg'
    max: 50
    dashes: true
    lowercase: false
  }
  namespace_hybrid_connection: {
    slug: 'rlhc'
    max: 260
    dashes: true
    lowercase: false
  }
  namespace_hybrid_connection_authorization_rule: {
    slug: 'namespace-hybrid-connection-authorization-rule'
    max: 50
    dashes: true
    lowercase: false
  }
  namespace_migration_configuration: {
    slug: 'namespacemigrationconfiguration'
    dashes: false
    lowercase: true
  }
  namespace_notification_hub: {
    slug: 'ntf'
    max: 260
    dashes: true
    lowercase: false
  }
  namespace_notification_hub_authorization_rule: {
    slug: 'nhar'
    max: 256
    dashes: true
    lowercase: false
  }
  namespace_queue: {
    slug: 'sbq'
    max: 260
    dashes: true
    lowercase: false
  }
  namespace_queue_authorization_rule: {
    slug: 'sbqar'
    max: 50
    dashes: true
    lowercase: false
  }
  namespace_topic: {
    slug: 'sbt'
    max: 260
    dashes: true
    lowercase: false
  }
  namespace_topic_authorization_rule: {
    slug: 'sbtar'
    max: 50
    dashes: true
    lowercase: false
  }
  namespace_topic_subscription: {
    slug: 'sbts'
    max: 50
    dashes: true
    lowercase: false
  }
  namespace_topic_subscription_rule: {
    slug: 'sbsr'
    max: 50
    dashes: true
    lowercase: false
  }
  namespace_wcf_relay: {
    slug: 'namespace-wcf-relay'
    max: 260
    dashes: true
    lowercase: false
  }
  namespace_wcf_relay_authorization_rule: {
    slug: 'namespace-wcf-relay-authorization-rule'
    max: 50
    dashes: true
    lowercase: false
  }
  nat_gateway: {
    slug: 'ng'
    max: 80
    dashes: false
    lowercase: true
  }
  net_app_account: {
    slug: 'net-app-account'
    max: 128
    dashes: true
    lowercase: false
  }
  net_app_account_backup: {
    slug: 'net-app-account-backup'
    max: 225
    dashes: true
    lowercase: false
  }
  net_app_account_backup_policy: {
    slug: 'net-app-account-backup-policy'
    max: 64
    dashes: true
    lowercase: false
  }
  net_app_account_bucket: {
    slug: 'net-app-account-bucket'
    max: 64
    dashes: true
    lowercase: false
  }
  net_app_account_capacity_pool: {
    slug: 'net-app-account-capacity-pool'
    max: 64
    dashes: true
    lowercase: false
  }
  net_app_account_share_name: {
    slug: 'net-app-account-share-name'
    max: 64
    dashes: true
    lowercase: false
  }
  net_app_account_snapshot: {
    slug: 'net-app-account-snapshot'
    max: 255
    dashes: true
    lowercase: false
  }
  net_app_account_snapshot_policy: {
    slug: 'net-app-account-snapshot-policy'
    max: 64
    dashes: true
    lowercase: false
  }
  net_app_account_volume: {
    slug: 'net-app-account-volume'
    max: 64
    dashes: true
    lowercase: false
  }
  net_app_account_volume_group: {
    slug: 'net-app-account-volume-group'
    max: 64
    dashes: true
    lowercase: false
  }
  network_cloud_cluster: {
    slug: 'network-cloud-cluster'
    max: 30
    dashes: true
    lowercase: false
  }
  network_cloud_virtual_machine: {
    slug: 'networkcloudvirtualmachine'
    max: 64
    dashes: false
    lowercase: false
  }
  network_ddos_protection_plan: {
    slug: 'ddospp'
    max: 80
    dashes: true
    lowercase: false
  }
  network_interface: {
    slug: 'nic'
    max: 80
    dashes: true
    lowercase: false
  }
  network_manager: {
    slug: 'vnm'
    max: 80
    dashes: false
    lowercase: true
  }
  network_security_group: {
    slug: 'nsg'
    max: 80
    dashes: true
    lowercase: false
  }
  network_security_group_security_rule: {
    slug: 'nsgsr'
    max: 80
    dashes: true
    lowercase: false
  }
  network_security_perimeter: {
    slug: 'nsp'
    dashes: false
    lowercase: true
  }
  network_watcher: {
    slug: 'nw'
    max: 80
    dashes: true
    lowercase: false
  }
  notification_hubs_namespace: {
    slug: 'ntfns'
    max: 50
    dashes: true
    lowercase: false
  }
  notification_hubs_namespace_authorization_rule: {
    slug: 'notification-hubs-namespace-authorization-rule'
    max: 256
    dashes: true
    lowercase: false
  }
  operational_insights_cluster: {
    slug: 'operational-insights-cluster'
    max: 63
    dashes: true
    lowercase: false
  }
  operational_insights_workspace: {
    slug: 'log'
    max: 63
    dashes: true
    lowercase: false
  }
  packet_core_control_plane: {
    slug: 'packet-core-control-plane'
    max: 64
    dashes: true
    lowercase: false
  }
  packet_core_control_plane_packet_core_data_plane: {
    slug: 'packet-core-control-plane-packet-core-data-plane'
    max: 64
    dashes: true
    lowercase: false
  }
  packet_core_control_plane_packet_core_data_plane_attached_data_network: {
    slug: 'data-network'
    max: 64
    dashes: true
    lowercase: false
  }
  point_to_site_vpn_gateway: {
    slug: 'vpngw'
    max: 80
    dashes: true
    lowercase: false
  }
  policy_assignment: {
    slug: 'policyassignment'
    dashes: false
    lowercase: true
  }
  policy_definition: {
    slug: 'pdef'
    max: 64
    dashes: false
    lowercase: true
  }
  policy_exemption: {
    slug: 'policyexemption'
    dashes: false
    lowercase: true
  }
  policy_set_definition: {
    slug: 'policysetdefinition'
    dashes: false
    lowercase: true
  }
  pool: {
    slug: 'mdp'
    dashes: false
    lowercase: true
  }
  power_bi_dedicated_capacity: {
    slug: 'pbi'
    max: 63
    dashes: false
    lowercase: true
  }
  pricing: {
    slug: 'pricing'
    max: 260
    dashes: true
    lowercase: false
  }
  private_cloud: {
    slug: 'private-cloud'
    max: 80
    dashes: true
    lowercase: false
  }
  private_dns_a_record: {
    slug: 'pdnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  private_dns_aaaa_record: {
    slug: 'pdnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  private_dns_cname_record: {
    slug: 'pdnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  private_dns_mx_record: {
    slug: 'pdnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  private_dns_ptr_record: {
    slug: 'pdnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  private_dns_srv_record: {
    slug: 'pdnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  private_dns_txt_record: {
    slug: 'pdnsrec'
    max: 80
    dashes: true
    lowercase: false
  }
  private_dns_zone: {
    slug: 'pdns'
    max: 63
    dashes: false
    lowercase: true
  }
  private_dns_zone_group: {
    slug: 'pdnszg'
    max: 80
    dashes: true
    lowercase: false
  }
  private_dns_zone_virtual_network_link: {
    slug: 'private-dns-zone-virtual-network-link'
    max: 80
    dashes: true
    lowercase: false
  }
  private_endpoint: {
    slug: 'pep'
    max: 64
    dashes: true
    lowercase: false
  }
  private_link_hub: {
    slug: 'synplh'
    max: 45
    dashes: false
    lowercase: true
  }
  private_link_scope: {
    slug: 'pls'
    dashes: false
    lowercase: true
  }
  private_link_service: {
    slug: 'pl'
    max: 64
    dashes: true
    lowercase: false
  }
  private_link_service_private_endpoint_connection: {
    slug: 'private-link-service-private-endpoint-connection'
    max: 64
    dashes: true
    lowercase: false
  }
  private_service_connection: {
    slug: 'psc'
    max: 80
    dashes: true
    lowercase: false
  }
  profile_afd_endpoint: {
    slug: 'fde'
    max: 50
    dashes: false
    lowercase: true
  }
  profile_afd_endpoint_route: {
    slug: 'cdnr'
    max: 50
    dashes: true
    lowercase: false
  }
  profile_cdn: {
    slug: 'cdnp'
    max: 260
    dashes: true
    lowercase: false
  }
  profile_endpoint: {
    slug: 'cdne'
    max: 50
    dashes: true
    lowercase: false
  }
  profile_front_door_standard_premium: {
    slug: 'afd'
    max: 260
    dashes: true
    lowercase: false
  }
  profile_origin_group: {
    slug: 'cdnog'
    max: 50
    dashes: true
    lowercase: false
  }
  profile_origin_group_origin: {
    slug: 'cdno'
    max: 50
    dashes: true
    lowercase: false
  }
  prometheus_rule_group: {
    slug: 'prometheusrulegroup'
    max: 260
    dashes: false
    lowercase: true
  }
  provisioning_service: {
    slug: 'provs'
    max: 64
    dashes: true
    lowercase: false
  }
  provisioning_service_certificate: {
    slug: 'pcert'
    max: 64
    dashes: true
    lowercase: false
  }
  proximity_placement_group: {
    slug: 'ppg'
    max: 80
    dashes: false
    lowercase: true
  }
  public_ip_address: {
    slug: 'pip'
    max: 80
    dashes: true
    lowercase: false
  }
  public_ip_prefix: {
    slug: 'ippre'
    max: 80
    dashes: true
    lowercase: false
  }
  purview_account: {
    slug: 'pview'
    max: 63
    dashes: false
    lowercase: true
  }
  quantum_workspace: {
    slug: 'quantum-workspace'
    max: 54
    dashes: true
    lowercase: false
  }
  querypack: {
    slug: 'pack'
    max: 63
    dashes: false
    lowercase: true
  }
  queue: {
    slug: 'queue'
    max: 63
    dashes: true
    lowercase: true
  }
  rack: {
    slug: 'rack'
    max: 30
    dashes: true
    lowercase: false
  }
  recovery_services_vault: {
    slug: 'rsv'
    max: 50
    dashes: true
    lowercase: false
  }
  redhat_openshift_cluster: {
    slug: 'aro'
    max: 63
    dashes: true
    lowercase: false
  }
  redis: {
    slug: 'redis'
    max: 63
    dashes: true
    lowercase: false
  }
  redis_enterprise: {
    slug: 'amr'
    dashes: false
    lowercase: true
  }
  redis_firewall_rule: {
    slug: 'redisfw'
    max: 256
    dashes: false
    lowercase: false
  }
  registration_hub: {
    slug: 'registration-hub'
    max: 30
    dashes: true
    lowercase: false
  }
  registration_hub_machine: {
    slug: 'registration-hub-machine'
    max: 40
    dashes: true
    lowercase: false
  }
  registry: {
    slug: 'cr'
    max: 50
    dashes: false
    lowercase: false
  }
  registry_build_task: {
    slug: 'registrybuildtask'
    max: 50
    dashes: false
    lowercase: false
  }
  registry_build_task_step: {
    slug: 'registrybuildtaskstep'
    max: 50
    dashes: false
    lowercase: false
  }
  registry_replication: {
    slug: 'registryreplication'
    max: 50
    dashes: false
    lowercase: false
  }
  registry_scope_map: {
    slug: 'registry-scope-map'
    max: 50
    dashes: true
    lowercase: false
  }
  registry_task: {
    slug: 'registry-task'
    max: 50
    dashes: true
    lowercase: false
  }
  registry_token: {
    slug: 'registry-token'
    max: 50
    dashes: true
    lowercase: false
  }
  registry_webhook: {
    slug: 'crwh'
    max: 50
    dashes: false
    lowercase: false
  }
  relay_namespace: {
    slug: 'rln'
    max: 50
    dashes: true
    lowercase: false
  }
  relay_namespace_authorization_rule: {
    slug: 'relay-namespace-authorization-rule'
    max: 50
    dashes: true
    lowercase: false
  }
  resource_group: {
    slug: 'rg'
    max: 90
    dashes: true
    lowercase: false
  }
  resource_guard: {
    slug: 'rgd'
    dashes: false
    lowercase: true
  }
  resource_provider: {
    slug: 'prov'
    max: 64
    dashes: false
    lowercase: true
  }
  restore_point_collection: {
    slug: 'rpc'
    max: 80
    dashes: false
    lowercase: true
  }
  role_assignment: {
    slug: 'ra'
    max: 36
    dashes: false
    lowercase: true
  }
  role_definition: {
    slug: 'rd'
    max: 36
    dashes: false
    lowercase: true
  }
  route_filter: {
    slug: 'rf'
    max: 80
    dashes: true
    lowercase: false
  }
  route_filter_route_filter_rule: {
    slug: 'route-filter-route-filter-rule'
    max: 80
    dashes: true
    lowercase: false
  }
  route_table: {
    slug: 'rt'
    max: 80
    dashes: true
    lowercase: false
  }
  route_table_route: {
    slug: 'udr'
    max: 80
    dashes: true
    lowercase: false
  }
  scaling_plan: {
    slug: 'vdscaling'
    max: 63
    dashes: false
    lowercase: true
  }
  scheduled_query_rule: {
    slug: 'scheduledqueryrule'
    max: 260
    dashes: false
    lowercase: true
  }
  scheduled_query_rule_alert: {
    slug: 'msqa'
    max: 260
    dashes: false
    lowercase: true
  }
  search_service: {
    slug: 'srch'
    max: 64
    dashes: false
    lowercase: true
  }
  security_contact: {
    slug: 'security-contact'
    max: 260
    dashes: true
    lowercase: false
  }
  server_administrator: {
    slug: 'serveradministrator'
    dashes: false
    lowercase: true
  }
  server_database_sync_group: {
    slug: 'server-database-sync-group'
    max: 150
    dashes: true
    lowercase: false
  }
  server_elastic_pool: {
    slug: 'sqlep'
    max: 128
    dashes: false
    lowercase: true
  }
  server_failover_group: {
    slug: 'sqlfg'
    max: 63
    dashes: true
    lowercase: true
  }
  server_farm: {
    slug: 'asp'
    max: 60
    dashes: true
    lowercase: false
  }
  server_groupsv2: {
    slug: 'cospos'
    max: 63
    dashes: false
    lowercase: true
  }
  server_job_agent: {
    slug: 'sqlja'
    max: 128
    dashes: false
    lowercase: true
  }
  server_key: {
    slug: 'serverkey'
    dashes: false
    lowercase: true
  }
  server_vulnerability_assessment: {
    slug: 'servervulnerabilityassessment'
    dashes: false
    lowercase: true
  }
  service_api: {
    slug: 'service-api'
    max: 80
    dashes: true
    lowercase: false
  }
  service_api_issue: {
    slug: 'service-api-issue'
    max: 80
    dashes: true
    lowercase: false
  }
  service_api_issue_attachment: {
    slug: 'service-api-issue-attachment'
    max: 80
    dashes: true
    lowercase: false
  }
  service_api_issue_comment: {
    slug: 'service-api-issue-comment'
    max: 80
    dashes: true
    lowercase: false
  }
  service_api_operation: {
    slug: 'service-api-operation'
    max: 80
    dashes: true
    lowercase: false
  }
  service_api_operation_tag: {
    slug: 'service-api-operation-tag'
    max: 80
    dashes: true
    lowercase: false
  }
  service_api_release: {
    slug: 'service-api-release'
    max: 80
    dashes: true
    lowercase: false
  }
  service_api_schema: {
    slug: 'service-api-schema'
    max: 80
    dashes: true
    lowercase: false
  }
  service_api_tag: {
    slug: 'service-api-tag'
    max: 80
    dashes: true
    lowercase: false
  }
  service_api_tag_description: {
    slug: 'service-api-tag-description'
    max: 80
    dashes: true
    lowercase: false
  }
  service_api_version_set: {
    slug: 'service-api-version-set'
    max: 80
    dashes: true
    lowercase: false
  }
  service_authorization_server: {
    slug: 'service-authorization-server'
    max: 80
    dashes: true
    lowercase: false
  }
  service_backend: {
    slug: 'service-backend'
    max: 80
    dashes: true
    lowercase: false
  }
  service_bus_namespace: {
    slug: 'sbns'
    max: 50
    dashes: true
    lowercase: false
  }
  service_bus_namespace_authorization_rule: {
    slug: 'sbar'
    max: 50
    dashes: true
    lowercase: false
  }
  service_bus_namespace_disaster_recovery_config: {
    slug: 'service-bus-namespace-disaster-recovery-config'
    max: 50
    dashes: true
    lowercase: false
  }
  service_certificate: {
    slug: 'service-certificate'
    max: 80
    dashes: true
    lowercase: false
  }
  service_diagnostic: {
    slug: 'service-diagnostic'
    max: 80
    dashes: true
    lowercase: false
  }
  service_end_point_policy: {
    slug: 'se'
    max: 80
    dashes: true
    lowercase: false
  }
  service_fabric_cluster: {
    slug: 'sf'
    max: 23
    dashes: true
    lowercase: true
  }
  service_fabric_managed_cluster: {
    slug: 'sfmc'
    dashes: false
    lowercase: true
  }
  service_group: {
    slug: 'service-group'
    max: 80
    dashes: true
    lowercase: false
  }
  service_group_user: {
    slug: 'service-group-user'
    max: 80
    dashes: true
    lowercase: false
  }
  service_identity_provider: {
    slug: 'service-identity-provider'
    max: 80
    dashes: true
    lowercase: false
  }
  service_logger: {
    slug: 'service-logger'
    max: 80
    dashes: true
    lowercase: false
  }
  service_notification: {
    slug: 'service-notification'
    max: 80
    dashes: true
    lowercase: false
  }
  service_notification_recipient_email: {
    slug: 'service-notification-recipient-email'
    max: 80
    dashes: true
    lowercase: false
  }
  service_openid_connect_provider: {
    slug: 'service-openid-connect-provider'
    max: 80
    dashes: true
    lowercase: false
  }
  service_policy: {
    slug: 'service-policy'
    max: 80
    dashes: true
    lowercase: false
  }
  service_product: {
    slug: 'service-product'
    max: 80
    dashes: true
    lowercase: false
  }
  service_product_api: {
    slug: 'service-product-api'
    max: 80
    dashes: true
    lowercase: false
  }
  service_product_group: {
    slug: 'service-product-group'
    max: 80
    dashes: true
    lowercase: false
  }
  service_product_tag: {
    slug: 'service-product-tag'
    max: 80
    dashes: true
    lowercase: false
  }
  service_project: {
    slug: 'migr'
    max: 57
    dashes: true
    lowercase: false
  }
  service_property: {
    slug: 'service-property'
    max: 80
    dashes: true
    lowercase: false
  }
  service_subscription: {
    slug: 'service-subscription'
    max: 80
    dashes: true
    lowercase: false
  }
  service_tag: {
    slug: 'service-tag'
    max: 80
    dashes: true
    lowercase: false
  }
  service_template: {
    slug: 'service-template'
    max: 80
    dashes: true
    lowercase: false
  }
  service_user: {
    slug: 'service-user'
    max: 80
    dashes: true
    lowercase: false
  }
  setting: {
    slug: 'setting'
    dashes: false
    lowercase: true
  }
  signal_r: {
    slug: 'sigr'
    max: 63
    dashes: true
    lowercase: false
  }
  sim_group: {
    slug: 'sim-group'
    max: 64
    dashes: true
    lowercase: false
  }
  sim_group_sim: {
    slug: 'sim-group-sim'
    max: 64
    dashes: true
    lowercase: false
  }
  site_function_app: {
    slug: 'func'
    max: 60
    dashes: true
    lowercase: false
  }
  site_private_endpoint_connection: {
    slug: 'site-private-endpoint-connection'
    max: 64
    dashes: true
    lowercase: false
  }
  site_slot: {
    slug: 'site-slot'
    max: 59
    dashes: true
    lowercase: false
  }
  site_web_app: {
    slug: 'app'
    max: 60
    dashes: true
    lowercase: false
  }
  snapshot: {
    slug: 'snap'
    max: 80
    dashes: true
    lowercase: false
  }
  solution: {
    slug: 'solution'
    dashes: false
    lowercase: true
  }
  spring: {
    slug: 'spring'
    max: 32
    dashes: true
    lowercase: true
  }
  sql_server: {
    slug: 'sql'
    max: 63
    dashes: true
    lowercase: true
  }
  sql_server_database: {
    slug: 'sqldb'
    max: 128
    dashes: false
    lowercase: true
  }
  sql_server_firewall_rule: {
    slug: 'sqlfw'
    max: 128
    dashes: false
    lowercase: true
  }
  sql_vulnerability_assessment_baseline_rule: {
    slug: 'sql-vulnerability-assessment-baseline-rule'
    max: 260
    dashes: true
    lowercase: false
  }
  ssh_public_key: {
    slug: 'sshkey'
    max: 80
    dashes: false
    lowercase: true
  }
  static_site: {
    slug: 'stapp'
    max: 40
    dashes: false
    lowercase: true
  }
  storage_account: {
    slug: 'st'
    max: 24
    dashes: false
    lowercase: true
  }
  storage_account_blob_service: {
    slug: 'storageaccountblobservice'
    dashes: false
    lowercase: true
  }
  storage_account_blob_service_container: {
    slug: 'storage-account-blob-service-container'
    max: 63
    dashes: true
    lowercase: true
  }
  storage_account_blob_service_container_blob_container: {
    slug: 'stct'
    max: 63
    dashes: true
    lowercase: true
  }
  storage_account_blob_service_container_data_lake_gen2_filesystem: {
    slug: 'stdl'
    max: 63
    dashes: true
    lowercase: true
  }
  storage_account_file_service: {
    slug: 'storageaccountfileservice'
    dashes: false
    lowercase: true
  }
  storage_account_file_service_share: {
    slug: 'share'
    max: 63
    dashes: true
    lowercase: true
  }
  storage_account_management_policy: {
    slug: 'storageaccountmanagementpolicy'
    dashes: false
    lowercase: true
  }
  storage_account_vm: {
    slug: 'stvm'
    max: 24
    dashes: false
    lowercase: true
  }
  storage_appliance: {
    slug: 'storage-appliance'
    max: 30
    dashes: true
    lowercase: false
  }
  storage_blob: {
    slug: 'blob'
    max: 1024
    dashes: true
    lowercase: false
  }
  storage_queue: {
    slug: 'stq'
    max: 63
    dashes: true
    lowercase: true
  }
  storage_share_directory: {
    slug: 'sts'
    max: 63
    dashes: true
    lowercase: true
  }
  storage_sync_service: {
    slug: 'sss'
    max: 260
    dashes: true
    lowercase: false
  }
  storage_sync_service_sync_group: {
    slug: 'storage-sync-service-sync-group'
    max: 260
    dashes: true
    lowercase: false
  }
  storage_table: {
    slug: 'stt'
    max: 63
    dashes: false
    lowercase: true
  }
  stream_analytics_cluster: {
    slug: 'asa'
    dashes: false
    lowercase: true
  }
  streamingjob: {
    slug: 'asa'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_function: {
    slug: 'streamingjob-function'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_function_javascript_udf: {
    slug: 'asafunc'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_input: {
    slug: 'streamingjob-input'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_input_reference_blob: {
    slug: 'asarblob'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_input_stream_blob: {
    slug: 'asaiblob'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_input_stream_event_hub: {
    slug: 'asaieh'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_input_stream_iot_hub: {
    slug: 'asaiiot'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_output: {
    slug: 'streamingjob-output'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_output_blob: {
    slug: 'asaoblob'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_output_event_hub: {
    slug: 'asaoeh'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_output_service_bus_queue: {
    slug: 'asaosbq'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_output_service_bus_topic: {
    slug: 'asaosbt'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_output_sql_database: {
    slug: 'asaomssql'
    max: 63
    dashes: true
    lowercase: false
  }
  streamingjob_transformation: {
    slug: 'streamingjob-transformation'
    max: 63
    dashes: true
    lowercase: false
  }
  synapse_workspace: {
    slug: 'synw'
    max: 50
    dashes: true
    lowercase: true
  }
  system_topic: {
    slug: 'egst'
    max: 50
    dashes: false
    lowercase: true
  }
  table: {
    slug: 'table'
    max: 63
    dashes: false
    lowercase: false
  }
  tag_name: {
    slug: 'tagname'
    max: 512
    dashes: false
    lowercase: true
  }
  tag_name_tag_value: {
    slug: 'tagnametagvalue'
    max: 256
    dashes: false
    lowercase: true
  }
  template_spec: {
    slug: 'ts'
    max: 90
    dashes: true
    lowercase: false
  }
  topic: {
    slug: 'egt'
    max: 50
    dashes: true
    lowercase: false
  }
  traffic_manager_profile: {
    slug: 'traf'
    max: 63
    dashes: true
    lowercase: false
  }
  trunked_network: {
    slug: 'trunked-network'
    max: 30
    dashes: true
    lowercase: false
  }
  user_assigned_identity: {
    slug: 'id'
    max: 128
    dashes: true
    lowercase: false
  }
  vault_backup_policy: {
    slug: 'vault-backup-policy'
    max: 150
    dashes: true
    lowercase: false
  }
  vault_backup_policy_virtual_machine: {
    slug: 'bkpol'
    max: 150
    dashes: true
    lowercase: false
  }
  vault_secret: {
    slug: 'kvs'
    max: 127
    dashes: true
    lowercase: false
  }
  video_indexer_account: {
    slug: 'avi'
    dashes: false
    lowercase: true
  }
  virtual_enclave: {
    slug: 've'
    dashes: false
    lowercase: true
  }
  virtual_enclave_enclave_endpoint: {
    slug: 'ee'
    dashes: false
    lowercase: true
  }
  virtual_enclave_workload: {
    slug: 'wl'
    dashes: false
    lowercase: true
  }
  virtual_hub_route_server: {
    slug: 'rtserv'
    max: 80
    dashes: false
    lowercase: true
  }
  virtual_hub_virtual_wan_hub: {
    slug: 'vhub'
    max: 80
    dashes: false
    lowercase: true
  }
  virtual_machine_console: {
    slug: 'virtualmachineconsole'
    dashes: false
    lowercase: true
  }
  virtual_machine_extension: {
    slug: 'vmx'
    max: 80
    dashes: true
    lowercase: false
  }
  virtual_machine_scale_set: {
    slug: 'vmss'
    max: 15
    dashes: false
    lowercase: true
  }
  virtual_machine_scale_set_extension: {
    slug: 'vmssx'
    max: 80
    dashes: true
    lowercase: false
  }
  virtual_machine_windows: {
    slug: 'vm'
    max: 15
    dashes: true
    lowercase: false
  }
  virtual_network: {
    slug: 'vnet'
    max: 64
    dashes: true
    lowercase: false
  }
  virtual_network_gateway: {
    slug: 'vgw'
    max: 80
    dashes: true
    lowercase: false
  }
  virtual_network_gateway_express_route_gateway: {
    slug: 'ergw'
    max: 80
    dashes: true
    lowercase: false
  }
  virtual_network_subnet: {
    slug: 'snet'
    max: 80
    dashes: true
    lowercase: false
  }
  virtual_network_virtual_network_peering: {
    slug: 'peer'
    max: 80
    dashes: true
    lowercase: false
  }
  virtual_wan: {
    slug: 'vwan'
    max: 80
    dashes: true
    lowercase: false
  }
  volume: {
    slug: 'volume'
    max: 64
    dashes: true
    lowercase: false
  }
  vpn_gateway: {
    slug: 'vpng'
    max: 80
    dashes: true
    lowercase: false
  }
  vpn_gateway_vpn_connection: {
    slug: 'vcn'
    max: 80
    dashes: true
    lowercase: false
  }
  vpn_site: {
    slug: 'vst'
    max: 80
    dashes: true
    lowercase: false
  }
  web_pub_sub: {
    slug: 'wps'
    dashes: false
    lowercase: true
  }
  web_service: {
    slug: 'webservice'
    max: 260
    dashes: false
    lowercase: true
  }
  workflow: {
    slug: 'logic'
    max: 43
    dashes: true
    lowercase: false
  }
  workspace_big_data_pool: {
    slug: 'synsp'
    max: 15
    dashes: false
    lowercase: true
  }
  workspace_collection: {
    slug: 'workspace-collection'
    max: 63
    dashes: true
    lowercase: false
  }
  workspace_compute: {
    slug: 'workspace-compute'
    dashes: true
    lowercase: false
  }
  workspace_datastore: {
    slug: 'workspacedatastore'
    dashes: false
    lowercase: true
  }
  workspace_hub: {
    slug: 'hub'
    max: 33
    dashes: true
    lowercase: false
  }
  workspace_machine_learning: {
    slug: 'mlw'
    max: 33
    dashes: true
    lowercase: false
  }
  workspace_project: {
    slug: 'proj'
    max: 33
    dashes: true
    lowercase: false
  }
  workspace_sql_pool: {
    slug: 'syndp'
    max: 60
    dashes: false
    lowercase: true
  }
}

@description('Azure region abbreviations following the claranet region naming standard (https://github.com/claranet/terraform-azurerm-regions). Lookup keys accept the AZ CLI name (`uksouth`), the dashed form (`uk-south`) and the display name (`UK South`), all case insensitive; values are the short notation used as the region segment of resource names.')
var regionCodes = {
  'asia-east': 'asea'
  'asia-pa': 'apac'
  'asia-pacific': 'apac'
  'asia-south-east': 'asse'
  asiapacific: 'apac'
  aus: 'aus'
  'aus-central': 'auc'
  'aus-central-2': 'auc2'
  'aus-east': 'aue'
  'aus-south-east': 'ause'
  australia: 'aus'
  'australia-central': 'auc'
  'australia-central-2': 'auc2'
  'australia-east': 'aue'
  'australia-southeast': 'ause'
  australiacentral: 'auc'
  australiacentral2: 'auc2'
  australiaeast: 'aue'
  australiasoutheast: 'ause'
  bra: 'bra'
  'bra-south': 'brs'
  'bra-south-east': 'brse'
  brazil: 'bra'
  'brazil-south': 'brs'
  'brazil-southeast': 'brse'
  brazilsouth: 'brs'
  brazilsoutheast: 'brse'
  can: 'can'
  'can-central': 'cac'
  'can-east': 'cae'
  canada: 'can'
  'canada-central': 'cac'
  'canada-east': 'cae'
  canadacentral: 'cac'
  canadaeast: 'cae'
  'central-india': 'inc'
  'central-us': 'usc'
  centralindia: 'inc'
  centralus: 'usc'
  'china-east': 'cne'
  'china-east-2': 'cne2'
  'china-east-3': 'cne3'
  'china-north': 'cnn'
  'china-north-2': 'cnn2'
  'china-north-3': 'cnn3'
  chinaeast: 'cne'
  chinaeast2: 'cne2'
  chinaeast3: 'cne3'
  chinanorth: 'cnn'
  chinanorth2: 'cnn2'
  chinanorth3: 'cnn3'
  'cn-east': 'cne'
  'cn-east-2': 'cne2'
  'cn-east-3': 'cne3'
  'cn-north': 'cnn'
  'cn-north-2': 'cnn2'
  'cn-north-3': 'cnn3'
  'east-asia': 'asea'
  'east-us': 'use'
  'east-us-2': 'use2'
  eastasia: 'asea'
  eastus: 'use'
  eastus2: 'use2'
  eu: 'eu'
  'eu-north': 'eun'
  'eu-west': 'euw'
  europe: 'eu'
  'fr-central': 'frc'
  'fr-south': 'frs'
  'france-central': 'frc'
  'france-south': 'frs'
  francecentral: 'frc'
  francesouth: 'frs'
  'ger-central': 'gce'
  'ger-north': 'gno'
  'ger-north-east': 'gne'
  'ger-west-central': 'gwc'
  'germany-central': 'gce'
  'germany-north': 'gno'
  'germany-northeast': 'gne'
  'germany-west-central': 'gwc'
  germanycentral: 'gce'
  germanynorth: 'gno'
  germanynortheast: 'gne'
  germanywestcentral: 'gwc'
  ind: 'ind'
  'ind-central': 'inc'
  'ind-south': 'ins'
  'ind-west': 'inw'
  india: 'ind'
  'isr-central': 'ilc'
  'israel-central': 'ilc'
  israelcentral: 'ilc'
  'ita-north': 'itn'
  'italy-north': 'itn'
  italynorth: 'itn'
  jap: 'jap'
  'jap-east': 'jpe'
  'jap-west': 'jpw'
  japan: 'jap'
  'japan-east': 'jpe'
  'japan-west': 'jpw'
  japaneast: 'jpe'
  japanwest: 'jpw'
  kor: 'kor'
  'kor-central': 'krc'
  'kor-south': 'krs'
  korea: 'kor'
  'korea-central': 'krc'
  'korea-south': 'krs'
  koreacentral: 'krc'
  koreasouth: 'krs'
  'new-zealand': 'nz'
  'new-zealand-north': 'nzn'
  newzealand: 'nz'
  newzealandnorth: 'nzn'
  nor: 'nor'
  'north-central-us': 'usnc'
  'north-europe': 'eun'
  northcentralus: 'usnc'
  northeurope: 'eun'
  'norw-east': 'noe'
  'norw-west': 'now'
  norway: 'nor'
  'norway-east': 'noe'
  'norway-west': 'now'
  norwayeast: 'noe'
  norwaywest: 'now'
  nz: 'nz'
  'nz-north': 'nzn'
  'pol-central': 'polc'
  'poland-central': 'polc'
  polandcentral: 'polc'
  'qat-central': 'qatc'
  'qatar-central': 'qatc'
  qatarcentral: 'qatc'
  'saf-north': 'san'
  'saf-west': 'saw'
  sgp: 'sgp'
  singapore: 'sgp'
  'south-africa-north': 'san'
  'south-africa-west': 'saw'
  'south-central-us': 'ussc'
  'south-india': 'ins'
  southafricanorth: 'san'
  southafricawest: 'saw'
  southcentralus: 'ussc'
  'southeast-asia': 'asse'
  southeastasia: 'asse'
  southindia: 'ins'
  swe: 'swe'
  'swe-central': 'swec'
  'swe-south': 'swes'
  sweden: 'swe'
  'sweden-central': 'swec'
  'sweden-south': 'swes'
  swedencentral: 'swec'
  swedensouth: 'swes'
  'switzerland-north': 'swn'
  'switzerland-west': 'sww'
  switzerlandnorth: 'swn'
  switzerlandwest: 'sww'
  'swz-north': 'swn'
  'swz-west': 'sww'
  'uae-central': 'uaec'
  'uae-north': 'uaen'
  uaecentral: 'uaec'
  uaenorth: 'uaen'
  'uk-south': 'uks'
  'uk-west': 'ukw'
  uksouth: 'uks'
  ukwest: 'ukw'
  'united-states': 'us'
  unitedstates: 'us'
  us: 'us'
  'us-central': 'usc'
  'us-east': 'use'
  'us-east-2': 'use2'
  'us-north-central': 'usnc'
  'us-south-central': 'ussc'
  'us-west': 'usw'
  'us-west-2': 'usw2'
  'us-west-3': 'usw3'
  'us-west-central': 'uswc'
  'west-central-us': 'uswc'
  'west-europe': 'euw'
  'west-india': 'inw'
  'west-us': 'usw'
  'west-us-2': 'usw2'
  'west-us-3': 'usw3'
  westcentralus: 'uswc'
  westeurope: 'euw'
  westindia: 'inw'
  westus: 'usw'
  westus2: 'usw2'
  westus3: 'usw3'
}



@description('Naming context for `segmentsFrom` and `resourceNameFrom`: define the core segments once (for example workload, environment, region) and pass the same object down to nested modules. `workload` is required - it is the primary naming component per the Cloud Adoption Framework; all other keys are optional. `region` accepts any Azure region form (`uksouth`, `uk-south`, `UK South`) and is abbreviated when names are composed. The type is sealed: unknown keys are rejected so context typos fail at build time; use the `extraSegments` parameter for additional segments.')
@sealed()
@export()
type namingContext = {
@description('Organization segment. Omit unless disambiguating globally-scoped names in estates where multiple organizations share a tenant.')
  organization: string?

@description('Workload, application, or project segment - the primary naming component per the Cloud Adoption Framework. Required: a context without a workload produces vague, collision-prone names.')
  workload: string

@description('Environment segment, for example `prod`, `dev`, `demo`.')
  environment: string?

@description('Region segment; accepts any Azure region form and is abbreviated to the short notation.')
  region: string?

@description('Component segment, for the resource role within the workload (for example `shared`, `api`). Usually supplied per resource via the `extraSegments` parameter instead.')
  component: string?
}



@description('Resolves an Azure region to its short abbreviation. Accepts the AZ CLI name (`westeurope`), the dashed form (`west-europe`/`eu-west`) or the display name (`West Europe`), case insensitive. Anything that is not a known region passes through unchanged.')
@export()
func regionCode(region string) string =>
  regionCodes[toLower(replace(region, ' ', '-'))] ?? region

@description('Returns the Cloud Adoption Framework abbreviation for a resource type (for example `resource_group` -> `rg`).')
@export()
func resourceAbbreviation(type resourceType) string =>
  nameRules[type].slug

@description('Returns the maximum name length allowed for the resource type, or 255 when no limit is documented.')
@export()
func resourceNameMaxLength(type resourceType) int =>
  nameRules[type].max ?? 255

@description('Trims the naming segments, resolves any segment naming an Azure region to its abbreviation, and drops empty segments.')
func normalizeSegments(segments string[]) string[] =>
  filter(map(segments, (segment) => regionCode(trim(segment))), (segment) => segment != '')

@description('Joins the type abbreviation and the naming segments with the separator the resource type allows (hyphens, or nothing when the type forbids them).')
func rawName(type resourceType, segments string[]) string =>
  join(concat([nameRules[type].slug], normalizeSegments(segments)), nameRules[type].dashes ? '-' : '')

@description('Applies the casing the resource type requires (lower case when the type disallows upper case).')
func applyCase(type resourceType, name string) string =>
  nameRules[type].lowercase ? toLower(name) : name

@description('Truncates the name to the maximum length allowed for the resource type when it would exceed the limit.')
func applyLengthLimit(type resourceType, name string) string =>
  take(name, nameRules[type].max ?? 255)

@description('Composes a resource name that complies with the rules of the resource type: the type abbreviation followed by the naming segments (typically workload, environment, region, component, in any number), hyphen delimited when the type allows hyphens, lower cased when the type requires it, and truncated to the type name limit when needed. Any segment naming an Azure region (`uksouth`, `UK South`) is abbreviated to its short form (`uks`). Pass only the segments you need; empty segments are dropped.')
@export()
func resourceName(type resourceType, segments string[]) string =>
  applyLengthLimit(type, applyCase(type, rawName(type, segments)))

@description('As `resourceName`, but with hyphens removed from the composed name, for resource types that disallow them in names (storage accounts) or for conventions that prefer compact names. The caller is responsible for keeping the combined length within the resource type limit; the name is truncated to the type limit when it exceeds it.')
@export()
func compactResourceName(type resourceType, segments string[]) string =>
  applyLengthLimit(type, applyCase(type, replace(rawName(type, segments), '-', '')))

@description('Converts a naming context object into ordered naming segments, for defining the core segments once (for example workload, environment, region) and passing them down to nested modules. Context keys, in this order: `organization`, `workload` (required), `environment`, `region`, `component`. The `region` key accepts any Azure region form (`uksouth`, `uk-south`, `UK South`) and is abbreviated; missing or empty keys are dropped.')
@export()
func segmentsFrom(context namingContext) string[] =>
  filter([
    trim(context.?organization ?? '')
    trim(context.workload)
    trim(context.?environment ?? '')
    regionCode(trim(context.?region ?? ''))
    trim(context.?component ?? '')
  ], (segment) => segment != '')

@description('Composes a compliant resource name from a naming context object plus any extra segments appended after the context segments (typically the component for that resource). `context` uses the keys of `segmentsFrom` (`organization`, `workload`, `environment`, `region`, `component`, with `workload` required and the rest optional); `extraSegments` may be null or empty. Define the context once at the top level and pass it to nested modules, which then name their resources without repeating the core segments.')
@export()
func resourceNameFrom(type resourceType, context namingContext, extraSegments string[]?) string =>
  resourceName(type, concat(segmentsFrom(context), extraSegments ?? []))


