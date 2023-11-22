resource "azurerm_resource_group" "resource_group" {
  name     = "rg-${var.project_name}"
  location = var.region

  tags = var.default_tags
}

resource "azurerm_container_registry" "container_registry" {
  # CR does not accept alphanumeric characters
  name                = "cr${replace(var.project_name, "-", "")}"

  resource_group_name = azurerm_resource_group.resource_group.name
  location            = var.region
  sku                 = "Standard"

  tags = var.default_tags
}

resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                         = "kc-${var.project_name}"
  resource_group_name          = azurerm_resource_group.resource_group.name
  location                     = var.region
  dns_prefix = "devops"

  default_node_pool {
    name = "default"
    vm_size = "Standard_B2s"
    node_count = 1
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.default_tags
}

resource "azurerm_public_ip" "public_ip" {
  name                    = "${var.project_name}-public-ip"
  resource_group_name     = azurerm_resource_group.resource_group.name
  location                = var.region
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

  tags = var.default_tags
}
