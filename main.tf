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
  source_port_range            = each.value.protocol
  source_port_ranges           = each.value.protocol
  destination_port_range       = each.value.protocol
  destination_port_ranges      = each.value.protocol
  source_address_prefix        = each.value.protocol
  source_address_prefixes      = each.value.protocol
  destination_address_prefix   = each.value.protocol
  destination_address_prefixes = each.value.protocol
}
