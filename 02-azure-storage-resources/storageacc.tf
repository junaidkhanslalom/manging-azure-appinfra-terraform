# variable "region" {
#   description = "Azure Region"

# }
# variable "ResourceGroup" {
#   description = "Please enter the resource group for the storage account"
# }

# variable "Stroage_Account_Name" {
#   description = "Please enther the name of this storage account"

# }
# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~>2.91.0"
#     }
#   }
# }

# # Configure the Microsoft Azure Provider
# provider "azurerm" {
#   features {}

# }

# resource "azurerm_storage_account" "sa" {
#   name                     = var.Stroage_Account_Name
#   resource_group_name      = var.ResourceGroup
#   location                 = var.region
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

#   tags = {
#     environment = "Terraform Storage"
#     CreatedBy   = "TF Admin"
#   }

# }

