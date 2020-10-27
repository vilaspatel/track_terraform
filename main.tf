provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "AKS_resourcegroup" {
  name     = var.resourcegroupname
  location = var.location
}

