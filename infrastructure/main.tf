provider "azurerm" {
  features {}
}

# 1. Resource Group Module
module "resource_group" {
  source   = "./modules/resource_group"
  rg_name  = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# 2. Networking Module
module "network" {
  source                = "./modules/vnet"
  rg_name               = module.resource_group.rg_name
  location              = var.location
  prefix                = var.prefix
  vnet_address_space    = var.vnet_space
  subnet_address_prefix = var.subnet_prefix
  tags                  = var.tags
}

# 3. ACR Module
module "acr" {
  source   = "./modules/acr"
  rg_name  = module.resource_group.rg_name
  location = var.location
  acr_name = var.acr_name
  tags     = var.tags
}

# 4. AKS Module
module "aks" {
  source         = "./modules/aks"
  rg_name        = module.resource_group.rg_name
  location       = var.location
  cluster_name   = var.aks_name
  vnet_subnet_id = module.network.subnet_id
  tags           = var.tags
}
