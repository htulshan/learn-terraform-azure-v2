#prod resource group
resource "azurerm_resource_group" "rg-prod-eus2-1" {
  name     = "${module.naming.resource_group.name}-prod-${var.primary-dc-location}-001"
  location = var.primary-dc-location
}


#hub resource group
resource "azurerm_resource_group" "rg-hub-eus2-1" {
  name     = "${module.naming.resource_group.name}-hub-${var.primary-dc-location}-001"
  location = var.primary-dc-location
}

#prod vnet
module "vnet-prod-eus2-1" {
  source           = "Azure/avm-res-network-virtualnetwork/azurerm"
  version          = "0.15.0"
  location         = var.primary-dc-location
  parent_id        = azurerm_resource_group.rg-prod-eus2-1.id
  address_space    = ["10.13.0.0/20"]
  name             = "${module.naming.virtual_network.name}-prod-${var.primary-dc-location}-001"
  enable_telemetry = false
  subnets = {
    subnet0 = {
      name             = "${module.naming.subnet.name}-prod-general-${var.primary-dc-location}-001"
      address_prefixes = ["10.13.1.0/24"]
    }
  }
}


#hub vnet
module "vnet-hub-eus2-1" {
  source           = "Azure/avm-res-network-virtualnetwork/azurerm"
  version          = "0.15.0"
  location         = var.primary-dc-location
  parent_id        = azurerm_resource_group.rg-hub-eus2-1.id
  address_space    = ["10.12.0.0/18"]
  name             = "${module.naming.virtual_network.name}-hub-${var.primary-dc-location}-001"
  enable_telemetry = false
  dns_servers = {
    dns_servers = ["8.8.8.8", "4.4.2.2", "1.1.1.1"]
  }
  subnets = {
    subnet0 = {
      name             = "${module.naming.subnet.name}-hub-management-${var.primary-dc-location}-001"
      address_prefixes = ["10.12.4.0/24"]
    }
    subnet1 = {
      name             = "${module.naming.subnet.name}-hub-trust-${var.primary-dc-location}-001"
      address_prefixes = ["10.12.3.0/24"]
    }
    subnet2 = {
      name             = "${module.naming.subnet.name}-hub-untrust-${var.primary-dc-location}-001"
      address_prefixes = ["10.12.1.0/24"]
    }
    subnet3 = {
      name             = "${module.naming.subnet.name}-hub-dmz-${var.primary-dc-location}-001"
      address_prefixes = ["10.12.2.0/24"]
    }
    subnet4 = {
      name             = "GatewaySubnet"
      address_prefixes = ["10.12.5.0/24"]
    }
  }
  peerings = {
    peertoprod1 = {
      name                                  = "${module.naming.virtual_network_peering.name}-${module.vnet-hub-eus2-1.name}-to-${module.vnet-prod-eus2-1.name}"
      remote_virtual_network_resource_id    = module.vnet-prod-eus2-1.resource_id
      allow_forwarded_traffic               = false
      allow_gateway_transit                 = true
      allow_virtual_network_access          = true
      do_not_verify_remote_gateways         = false
      enable_only_ipv6_peering              = false
      use_remote_gateways                   = false
      create_reverse_peering                = true
      reverse_name                          = "${module.naming.virtual_network_peering.name}-${module.vnet-prod-eus2-1.name}-to-${module.vnet-hub-eus2-1.name}"
      reverse_allow_forwarded_traffic       = true
      reverse_allow_gateway_transit         = false
      reverse_allow_virtual_network_access  = true
      reverse_do_not_verify_remote_gateways = false
      reverse_enable_only_ipv6_peering      = false
      reverse_use_remote_gateways           = false
    }
  }
}

