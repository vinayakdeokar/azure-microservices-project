environment = "prod"

resource_group_name = "ecom-rg-prod-canadacentral"

acr_name = "ecomacrprod001"

aks_name = "ecom-aks-cluster-prod-001"

node_count = 3

subnets = {

  # DMZ / Public Subnets (Load Balancer)
  prod-dmz-subnet-1  = "10.0.1.0/24"
  prod-dmz-subnet-2  = "10.0.2.0/24"

  # Application Subnets (AKS / App Services)
  prod-app-subnet-1  = "10.0.3.0/24"
  prod-app-subnet-2  = "10.0.4.0/24"

  # Data Subnets (Database)
  prod-data-subnet-1 = "10.0.5.0/24"
  prod-data-subnet-2 = "10.0.6.0/24"

}