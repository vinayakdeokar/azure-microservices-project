provider "azurerm" {
  features {}
}

# 1. Resource Group Module
module "resource_group" {
  source   = "./modules/resource_group"
  rg_name  = var.resource_group_name
  location = var.location
}

# 2. Networking Module (Output: subnet_id)
module "network" {
  source                = "./modules/vnet"
  rg_name               = module.resource_group.rg_name
  location              = var.location
  prefix                = var.prefix
  vnet_address_space    = var.vnet_space
  subnet_address_prefix = var.subnet_prefix
}

# 3. ACR Module
module "acr" {
  source   = "./modules/acr"
  rg_name  = module.resource_group.rg_name
  location = var.location
  acr_name = var.acr_name
}

# 4. AKS Module (Input: subnet_id from network module)
module "aks" {
  source         = "./modules/aks"
  rg_name        = module.resource_group.rg_name
  location       = var.location
  cluster_name   = var.aks_name
  vnet_subnet_id = module.network.subnet_id
}
