provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "aks" {
  name     = "${var.prefix_env}${var.prefix_loc}-${var.prefix_proj}-rg"
  location = var.location
  tags = {
    environment = "dev"
  }
}

module "network01" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.aks.name
  address_space       = "10.0.0.0/15"
  vnet_name           = "${var.prefix_env}${var.prefix_loc}-${var.prefix_proj}-vnet"
  subnet_prefixes     = ["10.1.8.32/27","10.1.8.0/27","10.1.0.0/21"]
  subnet_names        = ["aks-gateway","aks-dmz","aks-node"]
  tags = {
    environment = "dev"
  }
  depends_on          = [azurerm_resource_group.aks]
}

module "aks01" {
  source              = "Azure/aks/azurerm"
  resource_group_name = azurerm_resource_group.aks.name
  client_id           = var.client_id
  client_secret       = var.client_secret
  prefix              = "${var.prefix_env}${var.prefix_loc}-${var.prefix_proj}"
  vnet_subnet_id      = module.network01.vnet_subnets[2]
  os_disk_size_gb     = 126
  agents_count        = var.agents_count
  agents_size         = var.agents_size
  enable_log_analytics_workspace = false
  tags = {
    environment = "dev"
  }
  depends_on = [module.network01]
}
