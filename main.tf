


resource "azurerm_resource_group" "rg-prod-eus2-1"{
  name = "${module.naming.resource_group.name}-prod-${var.primary-dc-location}-001"
  location = var.primary-dc-location
}


module "vnet-prod-eus2-1"{
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.15.0"
  location = var.primary-dc-location
  parent_id = azurerm_resource_group.rg-prod-eus2-1.id
  address_space = ["10.12.0.0/20"]
  name = "${module.naming.virtual_network.name}-prod-${var.primary-dc-location}-001"
}
