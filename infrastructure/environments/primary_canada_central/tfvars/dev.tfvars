# ===============================
# Environment Configuration
# ===============================

environment = "dev"
project     = "ecom"
location    = "canadacentral"

# ===============================
# Resource Naming
# ===============================

resource_group_name = "ecom-rg-dev-canadacentral"
acr_name            = "ecomacrdev001"
aks_name            = "ecom-aks-cluster-dev-001"
prefix              = "ecom"

# ===============================
# AKS Cluster Configuration
# ===============================

kubernetes_version = "1.33.7"
node_count         = 1
vm_size            = "Standard_D2ps_v6"

# ===============================
# Networking Configuration
# ===============================

vnet_address_space = ["10.0.0.0/16"]
subnets = {

  # DMZ / Public Subnets (Load Balancer)
  dev-dmz-subnet-1 = "10.0.1.0/24"
  dev-dmz-subnet-2 = "10.0.2.0/24"

  # Application Subnets (AKS / App Services)
  dev-app-subnet-1 = "10.0.3.0/24"
  dev-app-subnet-2 = "10.0.4.0/24"

  # Data Subnets (Database)
  dev-data-subnet-1 = "10.0.5.0/24"
  dev-data-subnet-2 = "10.0.6.0/24"

}

service_cidr   = "10.1.0.0/16"
dns_service_ip = "10.1.0.10"

# ===============================
# Resource Tags
# ===============================
tags = {
  environment = "dev"
  project     = "ecom"
  owner       = "ecom-platform-team"
}

tags = {
  environment = "dev"
  project     = "ecom"
}

owner       = "ecom-team"
cost_center = "ecom-cc-dev"

keyvault_name = "ecom-keyvault-dev"

autoscaler_nodepool_name = "autoscale"

autoscaler_min_nodes = 1
autoscaler_max_nodes = 3
