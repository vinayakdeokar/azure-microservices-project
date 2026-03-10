output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

output "app_subnet_id" {
  value = azurerm_subnet.subnets["${var.environment}-app-subnet-1"].id
}

output "dmz_subnet_id" {
  value = azurerm_subnet.subnets["${var.environment}-dmz-subnet-1"].id
}

output "data_subnet_id" {
  value = azurerm_subnet.subnets["${var.environment}-data-subnet-1"].id
}