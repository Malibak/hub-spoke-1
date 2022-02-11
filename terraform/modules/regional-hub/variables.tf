variable "location" {
    description = "Region for hub (example: westeurope)"
    type = string
}

variable "vnet_address_ranges" {
    description = "Address range for hub VNet"
    type = list(string)
}

variable "subnet_address_ranges" {
    description = "Address range for hub subnet"
    type = list(string)
}

variable "required_tags" {
    description = "Tags to set on resources"
    type = map(string)
    default = {
        type = "hub"
        dataregion = ""
    }
}
