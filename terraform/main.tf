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
  name                = "api-demo-app-service"
  resource_group_name = var.demo_api_rg
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id
  https_only          = true

  depends_on = [
    azurerm_resource_group.main,
    azurerm_service_plan.main,
    azurerm_application_insights.main
  ]

  site_config {
    minimum_tls_version = "1.2"
    application_stack {
      java_version        = "17"
      java_server         = "JAVA"
      java_server_version = "17"
    }
  }
}

data "azurerm_log_analytics_workspace" "main" {
  name                 = "testloganalytics"
  resource_group_name  = "global-resources"
}
