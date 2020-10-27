provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks" {
  name     = var.resourcegroupname
  location = var.location
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.aks.name
  address_space       = "10.0.0.0/16"
  subnet_prefixes     = ["10.0.1.0/24","10.0.2.0/24"]
  subnet_names        = ["aks-gateway","aks-main"]
  depends_on          = [azurerm_resource_group.aks]
}

module "aks" {
  source              = "Azure/aks/azurerm"
  resource_group_name = azurerm_resource_group.aks.name
  client_id           = "your-service-principal-client-appid"
  client_secret       = "your-service-principal-client-password"
  prefix              = var.prefix
  vnet_subnet_id      = module.network.vnet_subnets[0]
  os_disk_size_gb     = 50
  agents_count        = var.agents_count
  agents_size         = var.agents_size
  enable_log_analytics_workspace = false
  # kubernetes_version  = var.kubernetes_version
  
  depends_on = [module.network]
}