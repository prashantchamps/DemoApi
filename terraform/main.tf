resource "azurerm_resource_group" "main" {
  name     = var.demo_api_rg
  location = var.location
}

resource "azurerm_service_plan" "main" {
  name                = "api-demo-service-plan"
  location            = var.location
  resource_group_name = var.demo_api_rg
  os_type             = "Linux"
  sku_name            = "S1"

  depends_on = [
    azurerm_resource_group.main
  ]
}

resource "azurerm_linux_web_app" "main" {
  name                = "api-demo-app"
  resource_group_name = var.demo_api_rg
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id

  depends_on = [
    azurerm_resource_group.main,
    azurerm_app_service_plan.main
  ]

  site_config {}
}
