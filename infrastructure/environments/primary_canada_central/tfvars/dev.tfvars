environment = "dev"

resource_group_name = "ecom-rg-dev-canadacentral"

acr_name = "ecomacrdev001"

aks_name = "ecom-aks-cluster-dev-001"

node_count = 1

subnets = {

  # DMZ / Public Subnets (Load Balancer)
  dev-dmz-subnet-1  = "10.0.1.0/24"
  dev-dmz-subnet-2  = "10.0.2.0/24"

  # Application Subnets (AKS / App Services)
  dev-app-subnet-1  = "10.0.3.0/24"
  dev-app-subnet-2  = "10.0.4.0/24"

  # Data Subnets (Database)
  dev-data-subnet-1 = "10.0.5.0/24"
  dev-data-subnet-2 = "10.0.6.0/24"

}