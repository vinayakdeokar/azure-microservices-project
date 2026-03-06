# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "vinayak-project-rg"
  location = "East US"
}

# 2. Azure Container Registry (ACR) - Jithe Docker images save hotil
resource "azurerm_container_registry" "acr" {
  name                = "vinayakprojectacr" # He naav unique pahije (fkt letters ani numbers)
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# 3. Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "vinayak-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "vinayakaks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s" # Swasta VM size
  }

  identity {
    type = "SystemAssigned"
  }
}

# 4. Role Assignment (AKS la ACR madhun image pull karaychi permission dene)
resource "azurerm_role_assignment" "aks_to_acr" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}
