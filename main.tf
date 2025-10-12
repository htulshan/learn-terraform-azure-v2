## Configure the Azure provider
#
#
## Create a resource group
#resource "azurerm_resource_group" "rg" {
#  name     = "myTFResourceGroup"
#  location = "eastus2"
#
#  tags = {
#    Environment = "Terraform Getting Started"
#    Team        = "Devops"
#    Billing     = var.billing
#  }
#}
#
#
## Create a virtual network
#resource "azurerm_virtual_network" "vnet" {
#  name                = "myTFVnet"
#  address_space       = ["10.0.0.0/16"]
#  location            = "eastus2"
#  resource_group_name = azurerm_resource_group.rg.name
#}
#
#
#
## Create a subnet
#resource "azurerm_subnet" "snet-network-vnet-prod-spoke-eastus2-001" {
#
#  #mandatory
#  name                 = "snet-network-vnet-prod-spoke-eastus2-001"
#  resource_group_name  = azurerm_resource_group.rg.name
#  virtual_network_name = azurerm_virtual_network.vnet.name
#
#  #optional
#  address_prefixes                  = ["10.0.1.0/24"]
#  private_endpoint_network_policies = "Enabled"
#
#}
#
#
#resource "azurerm_route_table" "table-1" {
#  bgp_route_propagation_enabled = false
#  location                      = var.location
#  name                          = "rt-palotrust-${var.location}-001"
#  resource_group_name           = azurerm_resource_group.rg.name
#  depends_on = [
#    azurerm_resource_group.rg
#  ]
#
#}
#
#
#
#
#resource "azurerm_route" "udr-default-palo-001" {
#  name                   = "udr-default-palo-001"
#  address_prefix         = "0.0.0.0/0"
#  next_hop_type          = "VirtualAppliance"
#  resource_group_name    = azurerm_resource_group.rg.name
#  route_table_name       = azurerm_route_table.table-1.name
#  next_hop_in_ip_address = "10.0.0.4"
#  depends_on = [
#    azurerm_route_table.table-1
#  ]
#}
#
#










#
#
#
#
#
#resource "azurerm_resource_group" "eus2-rg-bdf-001" {
#  name     = "Project-BDF"
#  location = "eastus2"
#}
#
#
#
#
# resource "azurerm_virtual_network" "eus2-vnet-hub-001" {
#    name = "Hub-Vnet"
# }



