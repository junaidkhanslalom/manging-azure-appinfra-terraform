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
resource "azurerm_virtual_network" "TFNet" {
    name = "myVnet"
    address_space = ["10.0.0.0/16"]
    location = "eastus"
    resource_group_name = "TFResourceGroup"

    tags = {
        environment = "Terraform VNET"
    }
  
}
# Create a Subnet
resource "azurerm_subnet" "tfsubnet" {
  name                 = "mySubnet"
  resource_group_name  = "TFResourceGroup"
  virtual_network_name = azurerm_virtual_network.TFNet.name
  address_prefixes       = ["10.0.1.0/24"]

}

resource "azurerm_subnet" "tfsubnet2" {
  name                 = "subnet2"
  resource_group_name  = "TFResourceGroup"
  virtual_network_name = azurerm_virtual_network.TFNet.name
  address_prefixes       = ["10.0.2.0/24"]
}