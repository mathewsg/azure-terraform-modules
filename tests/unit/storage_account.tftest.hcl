provider "azurerm" {
  features {
  }
}

variables {
  location            = "uksouth"
  resource_group_name = "module-testing"
  name                = "uksmoduletesting001"
  account_tier        = "Standard"
  replication_type    = "GRS"
  tags = {
    "env" = "Test"
  }
}

run "resource_group_name_check" {
  command = plan

  assert {
    condition     = azurerm_storage_account.this.resource_group_name == "module-testing"
    error_message = "Wrong Resource Group Name"
  }
}

run "name_check" {
  command = plan

  assert {
    condition     = azurerm_storage_account.this.name == "uksmoduletesting001"
    error_message = "Wrong Resource Group Name"
  }
}
