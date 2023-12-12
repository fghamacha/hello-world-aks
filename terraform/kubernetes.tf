resource "azurerm_kubernetes_cluster" "aks_hello_world" {

  name                    = var.K8S_NAME
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  dns_prefix              = "hello-world"
  kubernetes_version      = var.K8S_VERSION
  private_cluster_enabled = false
  default_node_pool {
    name           = "blue"
    node_count     = var.K8S_NODE_COUNT
    vm_size        = var.K8S_VM_SIZE
    vnet_subnet_id = module.virtual_network_fr_1.subnets["hello-world-aks-vn-app-subnet"].id

  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    "ENV" = var.ENVIRONMENT
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks_hello_world.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks_hello_world.kube_config_raw

  sensitive = true
}