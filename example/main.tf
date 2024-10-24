
module "resource_group" {
  source   = "../../"
  name     = "test-rg"
  location = "uksouth"
  tags = {
    env = "test"
  }
}
