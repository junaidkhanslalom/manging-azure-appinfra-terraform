## Depreciated but helpful lab

provider "azurerm" {
    version = 1.38
    }
resource "azurerm_storage_account" "lab" {
  name                     = "storage4terraformlab"
  resource_group_name      = "156-db81eadf-deploy-an-azure-storage-account-with"
  location                 = "East US"
  account_tier            = "Standard"
  account_replication_type = "LRS"

   tags = {
    environment = "Terraform Storage"
    CreatedBy = "Admin"
      }
  }