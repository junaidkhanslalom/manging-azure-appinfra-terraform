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

resource "azurerm_app_service_plan" "svcplan" {
  name = "newweb-appserviceplan"
  location = "eastus"
  resource_group_name = "TFResourceGroup"


  sku {
    tier = "Standard"
    size = "S1"
  }
  
}

resource "azurerm_app_service" "appsvc" {
  name = "custom-tf-webapp-for-thestudent"
  location = "eastus"
  resource_group_name = "TFResourceGroup"
  app_service_plan_id = azurerm_app_service_plan.svcplan.id 


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type = "LocalGit"
  } 
}