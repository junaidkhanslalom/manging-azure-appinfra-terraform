# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
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
resource "azurerm_mysql_server" "example" {
  name                = "test-v2-mysqlserver"
  location            = "eastus"
  resource_group_name = "TFResourceGroup"

  administrator_login          = "mysqladminun"
  administrator_login_password = "easytologin4once!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}


resource "azurerm_mysql_database" "example" {
  name                = "exampledB_test_v2"
  resource_group_name = "TFResourceGroup"
  server_name         = azurerm_mysql_server.example.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}