resource "azurerm_resource_group" "rg" {
  name     = "module-testing"
  location = "uksouth"
}

module "resource_group" {
  source              = "../"
  name                = "uksmoduletesting001"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "uksouth"
  replication_type    = "GRS"
  account_tier        = "Standard"
  tags = {
    env = "test"
  }
}
