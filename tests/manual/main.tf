terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0, < 4.0.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "module-testing"
  location = "uksouth"
}

module "resource_group" {
  source              = "../../"
  name                = "uksmoduletesting001"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "uksouth"
  replication_type    = "GRS"
  account_tier        = "Standard"
  tags = {
    env = "test"
  }
}
