module "regional_hub" {
    for_each = {
        westeurope = "eu"
        westus = "us"
    }
    source = "./modules/regional-hub"

    # Pass parameters:
    location = each.key
    vnet_address_ranges = ["10.0.0.0/16"]
    subnet_address_ranges = ["10.0.0.0/24"]
    required_tags = {
        type = "hub"
        dataregion = each.value
    }
}
