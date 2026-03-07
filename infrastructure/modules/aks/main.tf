resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.cluster_name

  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name           = "system"
    node_count     = 1
    vm_size        = var.vm_size
    vnet_subnet_id = var.vnet_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    load_balancer_sku   = "standard"
  
    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }

  tags = var.tags
}
