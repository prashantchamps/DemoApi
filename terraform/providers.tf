provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = var.tf_storage_rg_name
    storage_account_name = var.tf_storage_name
    container_name       = var.tf_storage_container_name
    key                  = "actions.tfstate"
  }
}

data "azurerm_client_config" "current" {}
