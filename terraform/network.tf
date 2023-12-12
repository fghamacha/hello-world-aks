resource "azurerm_resource_group" "rg" {
  name     = var.AZURE_RG_NAME
  location = var.AZURE_REGION
}

module "virtual_network_fr_1" {

  source = "./modules/azure/vnet"

  name = "hello-world-aks-vn"

  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = [var.VN_CIDR_BLOCK] # 65000 Address from "10.1.0.0" to "10.1.255.255"
  subnets = [
    { name = "${module.virtual_network_fr_1.name}-pub-subnet", address_prefixes = ["${var.PUB_SUBNET}"] },
    { name = "${module.virtual_network_fr_1.name}-app-subnet", address_prefixes = ["${var.APP_SUBNET}"] }
  ]

  tags = {

    "ENV" : var.ENVIRONMENT
  }

}
