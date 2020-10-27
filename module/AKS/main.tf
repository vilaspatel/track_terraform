resource "azurerm_kubernetes_cluster" "example" {
  name                = "${var.name}-${var.prefix}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  dns_prefix          = "${var.name}-${var.prefix}"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    aci_connector_linux {
      enabled = false
    }

    azure_policy {
      enabled = false
    }

    http_application_routing {
      enabled = false
    }

    kube_dashboard {
      enabled = true
    }

    oms_agent {
      enabled = false
    }
  }
}