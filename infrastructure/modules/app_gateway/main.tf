resource "azurerm_public_ip" "appgw_pip" {
  name                = "appgw-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "appgw" {

  name                = "aks-appgateway"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }
  ssl_policy {
    policy_type = "Predefined"
    policy_name = "AppGwSslPolicy20220101"
  }

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = var.appgw_subnet_id
  }

  frontend_port {
    name = "http-port"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = azurerm_public_ip.appgw_pip.id
  }

  backend_address_pool {
    name = "default-backend-pool"
  }

  backend_http_settings {
    name                  = "http-setting"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 30
  }

  http_listener {
    name                           = "http-listener"
    frontend_ip_configuration_name = "frontend-ip"
    frontend_port_name             = "http-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "rule1"
    rule_type                  = "Basic"
    http_listener_name         = "http-listener"
    backend_address_pool_name  = "default-backend-pool"
    backend_http_settings_name = "http-setting"
    priority                   = 1
  }

}
# ---------------------------------------------------------
# Automatically update Duck DNS when Public IP changes
# ---------------------------------------------------------
resource "null_resource" "update_duckdns" {
  triggers = {
    public_ip    = azurerm_public_ip.appgw_pip.ip_address
    force_update = timestamp()
  }

  provisioner "local-exec" {
    interpreter = ["pwsh", "-Command"]
    command     = "Invoke-RestMethod -Uri 'https://www.duckdns.org/update?domains=${var.duckdns_domain}&token=${var.duckdns_token}&ip=${azurerm_public_ip.appgw_pip.ip_address}'"
  }

  depends_on = [azurerm_public_ip.appgw_pip]
}