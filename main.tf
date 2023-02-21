resource "azurerm_network_security_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = merge(
    var.additional_tags,
    {
      created-by = "iac-tf"
    },
  )
}

resource "azurerm_network_security_rule" "this" {
  for_each                     = { for rule in var.security_rules : rule.name => rule }
  name                         = each.value.name
  resource_group_name          = var.resource_group_name
  network_security_group_name  = azurerm_network_security_group.this.name
  priority                     = each.value.priority
  direction                    = each.value.direction
  access                       = each.value.access
  protocol                     = each.value.protocol
  source_port_range            = length(each.value.source_port_ranges) == 0 ? each.value.source_port_range : null
  source_port_ranges           = each.value.source_port_ranges
  destination_port_range       = length(each.value.destination_port_ranges) == 0 ? each.value.destination_port_range : null
  destination_port_ranges      = each.value.destination_port_ranges
  source_address_prefix        = length(each.value.source_address_prefixes) == 0 ? each.value.source_address_prefix : null
  source_address_prefixes      = each.value.source_address_prefixes
  destination_address_prefix   = length(each.value.destination_address_prefixes) == 0 ? each.value.destination_address_prefix : null
  destination_address_prefixes = each.value.destination_address_prefixes
}

