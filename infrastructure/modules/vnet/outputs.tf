output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

output "app_subnet_id" {
  value = azurerm_subnet.subnets["app-subnet"].id
}

output "dmz_subnet_id" {
  value = azurerm_subnet.subnets["dmz-subnet"].id
}

output "data_subnet_id" {
  value = azurerm_subnet.subnets["data-subnet"].id
}