provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = "main-infra"
    storage_account_name = "mydemotfstate"
    container_name       = "apitfstate"
    key                  = "actions.tfstate"
  }
  required_providers {
    azurerm = {
      version = "~>3.2"
      source  = "hashicorp/azurerm"
    }
  }
}
