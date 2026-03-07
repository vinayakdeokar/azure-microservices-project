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
vm_size            = "Standard_D2as_v5"

# ===============================
# Networking Configuration
# ===============================

vnet_space   = ["10.0.0.0/16"]
subnet_prefix = ["10.0.1.0/24"]

# ===============================
# Resource Tags
# ===============================

tags = {
  Environment = "dev"
  Project     = "E-Commerce-Microservice"
  Owner       = "ECM-Platform-Team"
}
