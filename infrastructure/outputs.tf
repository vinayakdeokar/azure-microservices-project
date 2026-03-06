output "resource_group_name" {
  value = module.resource_group.rg_name  
}

output "aks_cluster_name" {
  value = module.aks.aks_name 
}

output "acr_login_server" {
  value = module.acr.acr_login_server 
}
