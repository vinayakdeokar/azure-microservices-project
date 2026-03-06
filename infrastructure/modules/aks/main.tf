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

  tags = var.tags
}
