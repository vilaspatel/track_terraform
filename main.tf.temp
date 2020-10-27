provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "AKS_resourcegroup" {
  name     = var.resourcegroupname
  location = var.location
}


module "elasticsearch_AKS"{
 depends_on = [azurerm_resource_group.AKS_resourcegroup]
 source = "./module/AKS"

 prefix = var.prefix
 name = var.Elasticsearch_name
 location = var.location
 resource_group_name = var.resourcegroupname

}
