# ---------------------------------------
# Resource Group Module
# ---------------------------------------
module "resource_group" {
  source   = "./modules/resource_group"
  rg_name  = var.resource_group_name
  location = var.location

  tags = merge(
    module.tags.tags,
    {
      Name = "rg-${local.name_prefix}"
    }
  )
}

# ---------------------------------------
# Virtual Network Module
# ---------------------------------------
module "network" {

  source             = "./modules/vnet"
  rg_name            = module.resource_group.rg_name
  location           = var.location
  prefix             = var.prefix
  environment        = var.environment
  vnet_address_space = var.vnet_address_space

  subnets = var.subnets

  tags = merge(
    module.tags.tags,
    {
      Name = "vnet-${local.name_prefix}"
    }
  )
}

# ---------------------------------------
# Azure Container Registry
# ---------------------------------------
module "acr" {
  source   = "./modules/acr"
  rg_name  = module.resource_group.rg_name
  location = var.location
  acr_name = var.acr_name

  tags = merge(
    module.tags.tags,
    {
      Name = "acr-${local.name_prefix}"
    }
  )
}


# -------------------------------
# Azure Kubernetes Service
# -------------------------------
module "aks" {
  source             = "./modules/aks"
  rg_name            = module.resource_group.rg_name
  location           = var.location
  cluster_name       = var.aks_name
  vnet_subnet_id     = module.network.app_subnet_id
  app_gateway_id     = module.app_gateway.app_gateway_id
  acr_id             = module.acr.acr_id
  kubernetes_version = var.kubernetes_version
  node_count         = var.node_count
  vm_size            = var.vm_size
  service_cidr       = var.service_cidr
  dns_service_ip     = var.dns_service_ip

  tags = merge(
    module.tags.tags,
    {
      Name = "aks-${local.name_prefix}"
    }
  )
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


  tags = merge(
    module.tags.tags,
    {
      Name = "kv-${local.name_prefix}"
    }
  )
}
# ---------------------------------------
# Application Gateway
# ---------------------------------------
module "app_gateway" {

  source = "./modules/app_gateway"

  resource_group_name = module.resource_group.rg_name
  location            = var.location

  appgw_subnet_id = module.network.dmz_subnet_id


  tags = merge(
    module.tags.tags,
    {
      Name = "appgw-${local.name_prefix}"
    }
  )
}
# ---------------------------------------
# AKS Autoscaler Node Pool
# ---------------------------------------
module "autoscaler" {
  source        = "./modules/autoscaler"
  aks_id        = module.aks.aks_id
  nodepool_name = var.autoscaler_nodepool_name
  vm_size       = var.vm_size
  min_nodes     = var.autoscaler_min_nodes
  max_nodes     = var.autoscaler_max_nodes

  tags = merge(
    module.tags.tags,
    {
      Name = "np-${local.name_prefix}"
    }
  )

  depends_on = [module.aks]
}

# ---------------------------------------
# AGIC RBAC Roles
# ---------------------------------------
resource "azurerm_role_assignment" "agic_network" {
  scope                = module.network.dmz_subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = module.aks.agic_identity_id
}

resource "azurerm_role_assignment" "agic_appgw" {
  scope                = module.app_gateway.app_gateway_id
  role_definition_name = "Contributor"
  principal_id         = module.aks.agic_identity_id
}

# ---------------------------------------
# Cert Manager Module
# ---------------------------------------
module "cert_manager" {
  source      = "./modules/cert_manager"
  email       = "admin@ecom-store-vd.duckdns.org"
  environment = var.environment

  depends_on = [module.aks]
}


# ---------------------------------------
# Central Tags Module
# ---------------------------------------
module "tags" {
  source      = "./modules/tags"
  environment = var.environment
  project     = var.project
  owner       = var.owner
  cost_center = var.cost_center
}

locals {
  name_prefix = "${var.project}-${var.environment}"
}
