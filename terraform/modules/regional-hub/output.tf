output "hub_vnet_id" {
    description = "Identifier of VNet"
    value = azurerm_virtual_network.hub_vnet_1.id
}

output "hub_region" {
    description = "Location of hub"
    value = azurerm_virtual_network.hub_vnet_1.location
}

output "hub_subnet_address_ranges" {
    description = "Address ranges of subnet"
    value = azurerm_subnet.hub_vnet_1_subnet_1.address_prefixes
}
