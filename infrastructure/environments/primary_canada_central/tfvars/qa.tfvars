# ===============================
# Environment Configuration
# ===============================

environment = "qa"
project     = "ecom"
location    = "canadacentral"

# ===============================
# Resource Naming
# ===============================

resource_group_name = "ecom-rg-qa-canadacentral"
acr_name            = "ecomacrqaa001"
aks_name            = "ecom-aks-cluster-qa-001"
prefix              = "ecom"

# ===============================
# AKS Cluster Configuration
# ===============================

kubernetes_version = "1.33.7"
node_count         = 2
vm_size            = "Standard_D2ps_v6"

# ===============================
# Networking Configuration
# ===============================

vnet_address_space = ["10.1.0.0/16"]
subnets = {

  # DMZ / Public Subnets (Load Balancer)
  qa-dmz-subnet-1 = "10.1.1.0/24"
  qa-dmz-subnet-2 = "10.1.2.0/24"

  # Application Subnets (AKS / App Services)
  qa-app-subnet-1 = "10.1.3.0/24"
  qa-app-subnet-2 = "10.1.4.0/24"

  # Data Subnets (Database)
  qa-data-subnet-1 = "10.1.5.0/24"
  qa-data-subnet-2 = "10.1.6.0/24"

}

service_cidr   = "10.2.0.0/16"
dns_service_ip = "10.2.0.10"

# ===============================
# Resource Tags
# ===============================

tags = {
  environment = "qa"
  project     = "ecom"
}

owner       = "ecom-team"
cost_center = "ecom-cc-qa"

keyvault_name = "ecom-keyvault-qa"

autoscaler_nodepool_name = "autoscale"

autoscaler_min_nodes = 2
autoscaler_max_nodes = 5

duckdns_domain = "ecom-qa-vd"
duckdns_token  = "161c59c4-994e-4722-b690-3cb6a01da8e7S"
