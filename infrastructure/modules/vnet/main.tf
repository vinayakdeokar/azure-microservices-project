resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-vnet"
  location            = var.location
  resource_group_name = var.rg_name

  address_space = var.vnet_address_space

  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}-aks-subnet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = var.subnet_address_prefix
}
