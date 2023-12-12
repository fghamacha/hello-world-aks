terraform {
  backend "azurerm" {
    resource_group_name  = "fghamacha-terraform-state-rg"
    storage_account_name = "fghamachatfstatestorage"
    container_name       = "fghamacha-tfstate-container"
    key                  = "fghamacha-tfstate-container"
  }
}