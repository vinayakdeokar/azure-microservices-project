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

acr_name = "ecomacrdev001"

aks_name = "ecom-aks-cluster-dev-001"

prefix = "ecom"

# ===============================
# AKS Cluster Configuration
# ===============================

kubernetes_version = "1.33.7"
node_count         = 1
vm_size            = "Standard_D2ps_v6"

# ===============================
# Networking Configuration
# ===============================

vnet_space    = ["10.0.0.0/16"]
subnet_prefix = ["10.0.1.0/24"]

service_cidr   = "10.1.0.0/16"
dns_service_ip = "10.1.0.10"

# ===============================
# Resource Tags
# ===============================

tags = {
  Environment = "dev"
  Project     = "E-Commerce-Microservice"
  Owner       = "ECM-Platform-Team"
}

keyvault_name = "ecom-keyvault-dev"

autoscaler_nodepool_name = "autoscale"

autoscaler_min_nodes = 1
autoscaler_max_nodes = 3
