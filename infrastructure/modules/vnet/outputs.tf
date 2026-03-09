output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

output "app_subnet_id" {
  value = azurerm_subnet.subnets["dev-app-subnet-1"].id
}

output "dmz_subnet_id" {
  value = azurerm_subnet.subnets["dev-dmz-subnet-1"].id
}

output "data_subnet_id" {
  value = azurerm_subnet.subnets["dev-data-subnet-1"].id
}