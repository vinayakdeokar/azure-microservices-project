# ===============================
# Environment Configuration
# ===============================

environment = "dev"
project     = "ecom"

# Terraform variables मध्ये location वापरले आहे
location = "eastus"

# ===============================
# Resource Naming
# ===============================

resource_group_name = "ecom-rg-dev-eastus"

acr_name = "ecomacrdev001"

aks_name = "ecom-aks-cluster-dev-001"

prefix = "ecom"

# ===============================
# AKS Cluster Configuration
# ===============================

kubernetes_version = "1.28.5"

node_count = 2

vm_size = "Standard_DS2_v2"

# ===============================
# Networking Configuration
# ===============================

vnet_space = ["10.0.0.0/16"]

subnet_prefix = [
  "10.0.1.0/24", # aks nodepool subnet
  "10.0.2.0/24", # ingress controller subnet
  "10.0.3.0/24", # internal services subnet
  "10.0.4.0/24"  # private endpoint subnet
]

# ===============================
# Resource Tags
# ===============================

tags = {
  Environment = "dev"
  Project     = "E-Commerce-Microservice"
  Owner       = "ECM-Platform-Team"
}

# AKS Configuration
kubernetes_version = "1.29"
node_count         = 2
vm_size            = "Standard_DS2_v2"
