environment = "uat"

resource_group_name = "ecom-rg-uat-canadacentral"

acr_name = "ecomacruat001"

aks_name = "ecom-aks-cluster-uat-001"

node_count = 2

subnets = {

  # DMZ / Public Subnets (Load Balancer)
  uat-dmz-subnet-1  = "10.0.1.0/24"
  uat-dmz-subnet-2  = "10.0.2.0/24"

  # Application Subnets (AKS / App Services)
  uat-app-subnet-1  = "10.0.3.0/24"
  uat-app-subnet-2  = "10.0.4.0/24"

  # Data Subnets (Database)
  uat-data-subnet-1 = "10.0.5.0/24"
  uat-data-subnet-2 = "10.0.6.0/24"

}