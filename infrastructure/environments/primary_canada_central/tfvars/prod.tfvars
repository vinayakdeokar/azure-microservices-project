# ===============================
# Environment Configuration
# ===============================

environment = "prod"
project     = "ecom"
location    = "canadacentral"

# ===============================
# Resource Naming
# ===============================

resource_group_name = "ecom-rg-prod-canadacentral"
acr_name            = "ecomacrproda001"
aks_name            = "ecom-aks-cluster-prod-001"
prefix              = "ecom"

# ===============================
# AKS Cluster Configuration
# ===============================

kubernetes_version = "1.33.7"
node_count         = 4
vm_size            = "Standard_D4ps_v6"

# ===============================
# Networking Configuration
# ===============================

vnet_address_space = ["10.3.0.0/16"]
subnets = {

  # DMZ / Public Subnets (Load Balancer)
  prod-dmz-subnet-1 = "10.3.1.0/24"
  prod-dmz-subnet-2 = "10.3.2.0/24"

  # Application Subnets (AKS / App Services)
  prod-app-subnet-1 = "10.3.3.0/24"
  prod-app-subnet-2 = "10.3.4.0/24"

  # Data Subnets (Database)
  prod-data-subnet-1 = "10.3.5.0/24"
  prod-data-subnet-2 = "10.3.6.0/24"

}

service_cidr   = "10.4.0.0/16"
dns_service_ip = "10.4.0.10"

# ===============================
# Resource Tags
# ===============================

tags = {
  environment = "prod"
  project     = "ecom"
  owner       = "ecom-platform-team"
}

keyvault_name = "ecom-keyvault-prod"

autoscaler_nodepool_name = "autoscale"

autoscaler_min_nodes = 4
autoscaler_max_nodes = 10