terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = var.tf_storage_rg_name
    storage_account_name = var.tf_storage_name
    container_name       = var.tf_storage_container_name
    key                  = "actions.tfstate"
  }
  required_providers {
    azurerm = {
      version = "~>3.2"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" { 
  features {}  
}