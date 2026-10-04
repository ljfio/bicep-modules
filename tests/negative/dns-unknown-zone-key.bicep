import * as dns from '../../modules/dns/dns.bicep'

// An unknown private DNS zone key must be rejected by the privateDnsZoneKey union.
output zone string = dns.privateDnsZone('storage_account_nfs')
