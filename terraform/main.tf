resource "azurerm_resource_group" "main" {
  name     = var.demo_api_rg
  location = var.location
}


resource "azurerm_app_service_plan" "main" {
  name                = "api-demo-service-plan"
  location            = var.location
  resource_group_name = var.demo_api_rg
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_linux_web_app" "main" {
  name                = "api-demo-app"
  resource_group_name = var.demo_api_rg
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id

  site_config {}
}