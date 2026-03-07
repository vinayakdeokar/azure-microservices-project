resource "azurerm_kubernetes_cluster_node_pool" "autoscale_pool" {
  name                  = var.nodepool_name
  kubernetes_cluster_id = var.aks_id
  vm_size               = var.vm_size

  enable_auto_scaling = true
  min_count           = var.min_nodes
  max_count           = var.max_nodes

  node_count = var.min_nodes

  mode = "User"

  tags = var.tags
}
