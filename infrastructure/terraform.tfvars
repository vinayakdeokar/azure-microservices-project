resource_group_name = "ecommerce-rg"
location            = "East US"
acr_name            = "ecom-acr-dev-001"
aks_name            = "ecom-aks-cluster-dev-001"
prefix              = "ecom"

# Networking Details
vnet_space    = ["10.0.0.0/16"]
subnet_prefix = ["10.0.1.0/24"]

tags = {
  Environment = "Dev"
  Project     = "E-Commerce-Microservice"
  Owner       = "ECM-Platform-Team"
}
