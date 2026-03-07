# ---------------------------------------
# Resource Group Module
# ---------------------------------------
module "resource_group" {
  source   = "./modules/resource_group"
  rg_name  = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# ---------------------------------------
# Virtual Network Module
# ---------------------------------------
module "network" {
  source                = "./modules/vnet"
  rg_name               = module.resource_group.rg_name
  location              = var.location
  prefix                = var.prefix
  vnet_address_space    = var.vnet_space
  subnet_address_prefix = var.subnet_prefix
  tags                  = var.tags
}

# ---------------------------------------
# Azure Container Registry
# ---------------------------------------
module "acr" {
  source   = "./modules/acr"
  rg_name  = module.resource_group.rg_name
  location = var.location
  acr_name = var.acr_name
  tags     = var.tags
}

# -------------------------------
# Azure Kubernetes Service
# -------------------------------
module "aks" {
  source         = "./modules/aks"
  rg_name        = module.resource_group.rg_name
  location       = var.location
  cluster_name   = var.aks_name
  vnet_subnet_id = module.network.subnet_id

  kubernetes_version = var.kubernetes_version
  node_count         = var.node_count
  vm_size            = var.vm_size

  service_cidr   = var.service_cidr
  dns_service_ip = var.dns_service_ip

  tags = var.tags
}

# ---------------------------------------
# Azure Key Vault
# ---------------------------------------
module "keyvault" {
  source   = "./modules/keyvault"
  rg_name  = module.resource_group.rg_name
  location = var.location

  keyvault_name = var.keyvault_name
  tenant_id     = data.azurerm_client_config.current.tenant_id

  tags = var.tags
}
# ---------------------------------------
# NGINX Ingress Controller
# ---------------------------------------
module "ingress" {
  source = "./modules/ingress"

  aks_cluster_name = var.aks_name
  rg_name          = module.resource_group.rg_name

  tags = var.tags
}
# ---------------------------------------
# AKS Autoscaler Node Pool
# ---------------------------------------
module "autoscaler" {
  source = "./modules/autoscaler"

  aks_id = module.aks.aks_id

  nodepool_name = var.autoscaler_nodepool_name
  vm_size       = var.vm_size

  min_nodes = var.autoscaler_min_nodes
  max_nodes = var.autoscaler_max_nodes

  tags = var.tags
}
