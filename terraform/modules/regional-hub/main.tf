#Resources:
resource "azurerm_resource_group" "hub_rg" {
    name = "hub-${var.location}-rg"
    location = var.location
}

resource "azurerm_network_security_group" "hub_nsg_1" {
    name = "hub-${var.location}-nsg-1"
    location = azurerm_resource_group.hub_rg.location
    resource_group_name = azurerm_resource_group.hub_rg.name
    tags = var.required_tags
}

resource "azurerm_virtual_network" "hub_vnet_1" {
    name = "hub-${var.location}-vnet-1"
    location = azurerm_resource_group.hub_rg.location
    resource_group_name = azurerm_resource_group.hub_rg.name
    address_space = var.vnet_address_ranges
    tags = var.required_tags
}

resource "azurerm_subnet" "hub_vnet_1_subnet_1" {
    name = "hub-${var.location}-vnet-1-subnet-1"
    resource_group_name = azurerm_resource_group.hub_rg.name
    virtual_network_name = azurerm_virtual_network.hub_vnet_1.name
    address_prefixes = var.subnet_address_ranges
}

resource "azurerm_subnet_network_security_group_association" "hub_vnet_1_subnet_1_nsg_association" {
    subnet_id = azurerm_subnet.hub_vnet_1_subnet_1.id
    network_security_group_id = azurerm_network_security_group.hub_nsg_1.id
}
