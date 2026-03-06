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

  default_node_pool {
    name           = "system"
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = var.vnet_subnet_id

    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }

  tags = var.tags
}
