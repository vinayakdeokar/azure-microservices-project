environment = "qa"

resource_group_name = "ecom-rg-qa-canadacentral"

acr_name = "ecomacrqa001"

aks_name = "ecom-aks-cluster-qa-001"

node_count = 2

subnets = {

  # DMZ / Public Subnets (Load Balancer)
  qa-dmz-subnet-1  = "10.0.1.0/24"
  qa-dmz-subnet-2  = "10.0.2.0/24"

  # Application Subnets (AKS / App Services)
  qa-app-subnet-1  = "10.0.3.0/24"
  qa-app-subnet-2  = "10.0.4.0/24"

  # Data Subnets (Database)
  qa-data-subnet-1 = "10.0.5.0/24"
  qa-data-subnet-2 = "10.0.6.0/24"

}