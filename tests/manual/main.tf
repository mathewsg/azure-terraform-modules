terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0, < 4.0.0"
    }
    azapi = {
      source = "Azure/azapi"
    }
  }
}

provider "azurerm" {
  features {
  }
}


module "resource_group" {
  source   = "../../"
  name     = "test-rg"
  location = "uksouth"
  tags = {
    env = "test"
  }
}
