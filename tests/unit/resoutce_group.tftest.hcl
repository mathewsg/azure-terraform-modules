provider "azurerm" {
  features {
  }
}

variables {
  name     = "Test-RG"
  location = "uksouth"
  tags = {
    "env" = "Test"
  }
}

run "resource_group_name_check" {
  command = plan

  assert {
    condition     = azurerm_resource_group.this.name == "Test-RG"
    error_message = "Wrong Resource Group Name"
  }
}

run "location_check" {
  command = plan

  assert {
    condition     = azurerm_resource_group.this.location == "uksouth"
    error_message = "Wrong Location"
  }
}

run "tags_check" {
  command = plan

  assert {
    condition     = jsonencode(azurerm_resource_group.this.tags) == jsonencode({ "env" = "Test" })
    error_message = "Wrong Tags"
  }
}
