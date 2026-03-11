# ===============================
# Environment Configuration
# ===============================

environment = "uat"
project     = "ecom"
location    = "canadacentral"

# ===============================
# Resource Naming
# ===============================

resource_group_name = "ecom-rg-uat-canadacentral"
acr_name            = "ecomacruata001"
aks_name            = "ecom-aks-cluster-uat-001"
prefix              = "ecom"

# ===============================
# AKS Cluster Configuration
# ===============================

kubernetes_version = "1.33.7"
node_count         = 3
vm_size            = "Standard_D2ps_v6"

# ===============================
# Networking Configuration
# ===============================

vnet_address_space = ["10.2.0.0/16"]
subnets = {

  # DMZ / Public Subnets (Load Balancer)
  uat-dmz-subnet-1 = "10.2.1.0/24"
  uat-dmz-subnet-2 = "10.2.2.0/24"

  # Application Subnets (AKS / App Services)
  uat-app-subnet-1 = "10.2.3.0/24"
  uat-app-subnet-2 = "10.2.4.0/24"

  # Data Subnets (Database)
  uat-data-subnet-1 = "10.2.5.0/24"
  uat-data-subnet-2 = "10.2.6.0/24"

}

service_cidr   = "10.3.0.0/16"
dns_service_ip = "10.3.0.10"

# ===============================
# Resource Tags
# ===============================

tags = {
  environment = "uat"
  project     = "ecom"
  owner       = "ecom-platform-team"
}

keyvault_name = "ecom-keyvault-uat"

autoscaler_nodepool_name = "autoscale"

autoscaler_min_nodes = 3
autoscaler_max_nodes = 7