terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.91.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

}
resource "azurerm_storage_account" "lab" {
  name                     = "junaidxyztestblob"
  resource_group_name      = "TFResourceGroup"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "lab" {
  name                  = "blobcontainer4dev"
  storage_account_name  = azurerm_storage_account.lab.name
  container_access_type = "private"
}
resource "azurerm_storage_blob" "lab" {
  name                   = "TerraformdevBlob"
  storage_account_name   = azurerm_storage_account.lab.name
  storage_container_name = azurerm_storage_container.lab.name
  type                   = "Block"
}

resource "azurerm_storage_share" "lab" {
  name                 = "terraformdevshare"
  storage_account_name = azurerm_storage_account.lab.name
  quota                = 50

}