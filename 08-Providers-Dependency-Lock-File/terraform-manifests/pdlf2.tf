# Resource-1: Azure Resource Group

resource "azurerm_resource_group" "VinRG1" {
  name     = "VinRG-1"
  location = "East US"
}
# Resource-2: Random String 
resource "random_string" "ran" {
  length = 16
  special = true
  override_special = "vinsys"
}
# Resource-3: Azure Storage Account 
resource "azurerm_storage_account" "VinStore" {
  name                     = "VinStore${random_string.ran.id}"
  resource_group_name      = azurerm_resource_group.VinRG1.name
  location                 = azurerm_resource_group.VinRG1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}