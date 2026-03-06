output "aks_id" {
  description = "AKS cluster ID"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "kube_config" {
  description = "Kubeconfig for cluster access"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}
