terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  required_version = ">= 0.13"
}
provider "azurerm" {
  subscription_id = var.subscription_id
  version           = "~>2.41" 
}