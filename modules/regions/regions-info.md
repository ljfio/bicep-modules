# Region pairs and geographies

Azure paired regions and geographies, curated by hand in
`scripts/generate_regions.py` (the abbreviation source has no machine-readable
paired-region or geography data) - spot-check against the cited pages when
reviewing changes. Paired regions follow
[Microsoft Learn, Azure paired regions](https://learn.microsoft.com/azure/reliability/cross-region-replication-azure);
China region pairs follow the in-country pairing of the 21Vianet-operated
regions and are not listed on that page. Geographies follow the
[Azure geographies](https://azure.microsoft.com/explore/global-infrastructure/geographies/)
taxonomy of the Azure region metadata.

| Region | AZ CLI name | Abbreviation | Paired region | Geography |
|---|---|---|---|---|
| Australia Central | `australiacentral` | `auc` | `australiacentral2` | Australia |
| Australia Central 2 | `australiacentral2` | `auc2` | `australiacentral` | Australia |
| Australia East | `australiaeast` | `aue` | `australiasoutheast` | Australia |
| Australia Southeast | `australiasoutheast` | `ause` | `australiaeast` | Australia |
| Brazil South | `brazilsouth` | `brs` | `southcentralus` | South America |
| Brazil Southeast | `brazilsoutheast` | `brse` | `brazilsouth` | South America |
| Canada Central | `canadacentral` | `cac` | `canadaeast` | North America |
| Canada East | `canadaeast` | `cae` | `canadacentral` | North America |
| Central India | `centralindia` | `inc` | `southindia` | Asia Pacific |
| Central US | `centralus` | `usc` | `eastus2` | North America |
| China East | `chinaeast` | `cne` | `chinanorth` | Asia Pacific |
| China East 2 | `chinaeast2` | `cne2` | `chinanorth2` | Asia Pacific |
| China East 3 | `chinaeast3` | `cne3` | `chinanorth3` | Asia Pacific |
| China North | `chinanorth` | `cnn` | `chinaeast` | Asia Pacific |
| China North 2 | `chinanorth2` | `cnn2` | `chinaeast2` | Asia Pacific |
| China North 3 | `chinanorth3` | `cnn3` | `chinaeast3` | Asia Pacific |
| East Asia | `eastasia` | `asea` | `southeastasia` | Asia Pacific |
| East US | `eastus` | `use` | `westus` | North America |
| East US 2 | `eastus2` | `use2` | `centralus` | North America |
| France Central | `francecentral` | `frc` | `francesouth` | Europe |
| France South | `francesouth` | `frs` | `francecentral` | Europe |
| Germany Central | `germanycentral` | `gce` | &mdash; | Europe |
| Germany North | `germanynorth` | `gno` | `germanywestcentral` | Europe |
| Germany Northeast | `germanynortheast` | `gne` | &mdash; | Europe |
| Germany West Central | `germanywestcentral` | `gwc` | `germanynorth` | Europe |
| Israel Central | `israelcentral` | `ilc` | &mdash; | Middle East |
| Italy North | `italynorth` | `itn` | &mdash; | Europe |
| Japan East | `japaneast` | `jpe` | `japanwest` | Asia Pacific |
| Japan West | `japanwest` | `jpw` | `japaneast` | Asia Pacific |
| Korea Central | `koreacentral` | `krc` | `koreasouth` | Asia Pacific |
| Korea South | `koreasouth` | `krs` | `koreacentral` | Asia Pacific |
| New Zealand North | `newzealandnorth` | `nzn` | &mdash; | Asia Pacific |
| North Central US | `northcentralus` | `usnc` | `southcentralus` | North America |
| North Europe | `northeurope` | `eun` | `westeurope` | Europe |
| Norway East | `norwayeast` | `noe` | `norwaywest` | Europe |
| Norway West | `norwaywest` | `now` | `norwayeast` | Europe |
| Poland Central | `polandcentral` | `polc` | &mdash; | Europe |
| Qatar Central | `qatarcentral` | `qatc` | &mdash; | Middle East |
| South Africa North | `southafricanorth` | `san` | `southafricawest` | Africa |
| South Africa West | `southafricawest` | `saw` | `southafricanorth` | Africa |
| South Central US | `southcentralus` | `ussc` | `northcentralus` | North America |
| South India | `southindia` | `ins` | `centralindia` | Asia Pacific |
| Southeast Asia | `southeastasia` | `asse` | `eastasia` | Asia Pacific |
| Sweden Central | `swedencentral` | `swec` | `swedensouth` | Europe |
| Sweden South | `swedensouth` | `swes` | `swedencentral` | Europe |
| Switzerland North | `switzerlandnorth` | `swn` | `switzerlandwest` | Europe |
| Switzerland West | `switzerlandwest` | `sww` | `switzerlandnorth` | Europe |
| UAE Central | `uaecentral` | `uaec` | `uaenorth` | Middle East |
| UAE North | `uaenorth` | `uaen` | `uaecentral` | Middle East |
| UK South | `uksouth` | `uks` | `ukwest` | Europe |
| UK West | `ukwest` | `ukw` | `uksouth` | Europe |
| West Central US | `westcentralus` | `uswc` | `westus2` | North America |
| West Europe | `westeurope` | `euw` | `northeurope` | Europe |
| West India | `westindia` | `inw` | `southindia` | Asia Pacific |
| West US | `westus` | `usw` | `eastus` | North America |
| West US 2 | `westus2` | `usw2` | `westcentralus` | North America |
| West US 3 | `westus3` | `usw3` | `eastus` | North America |
