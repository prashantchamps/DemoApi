resource "azurerm_resource_group" "main" {
  name     = var.demo_api_rg
  location = var.location
}
