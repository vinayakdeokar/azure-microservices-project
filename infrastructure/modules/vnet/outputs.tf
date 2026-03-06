output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "Subnet ID for AKS nodes"
  value       = azurerm_subnet.subnet.id
}
