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
    azurerm_log_analytics_workspace.main
  ]

  site_config {
    minimum_tls_version = "1.2"
    application_stack {
      java_version        = "17"
      java_server         = "JAVA"
      java_server_version = "17"
    }
  }

  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY =  azurerm_application_insights.main.application_insights.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING =  azurerm_application_insights.main.application_insights.connection_string
  }
}

data "azurerm_log_analytics_workspace" "main" {
  name                 = "testloganalytics"
  resource_group_name  = "global-resources"
}

resource "azurerm_application_insights" "main" {
  name                = "api-demo-app-service-insight"
  location            = var.location
  resource_group_name = var.demo_api_rg
  workspace_id        = data.azurerm_log_analytics_workspace.example.id
  application_type    = "web"

  depends_on = [
    azurerm_resource_group.main,
    azurerm_service_plan.main,
    azurerm_log_analytics_workspace.main
  ]
}
