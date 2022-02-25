# Deploying recover service vaults 
resource "azurerm_recovery_services_vault" "vault" {
  name                = "Terraform-recovery-vault"
  location            = "eastus"
  resource_group_name = "TFResourceGroup"
  sku                 = "Standard"
}