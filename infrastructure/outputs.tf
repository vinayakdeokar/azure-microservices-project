# ---------------------------------------
# Resource Group Output
# ---------------------------------------
output "resource_group_name" {
  description = "Name of the created resource group"
  value       = module.resource_group.rg_name
}

# ---------------------------------------
# Virtual Network Subnet Output
# ---------------------------------------
output "aks_subnet_id" {
  description = "Subnet ID used by AKS cluster"
  value       = module.network.app_subnet_id
}

# ---------------------------------------
# Azure Container Registry Outputs
# ---------------------------------------
output "acr_id" {
  description = "Azure Container Registry ID"
  value       = module.acr.acr_id
}

output "acr_login_server" {
  description = "ACR login server URL"
  value       = module.acr.acr_login_server
}

# ---------------------------------------
# AKS Cluster Outputs
# ---------------------------------------
output "aks_cluster_name" {
  description = "AKS cluster name"
  value       = module.aks.aks_name
}

output "aks_cluster_id" {
  description = "AKS cluster ID"
  value       = module.aks.aks_id
}
