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
  source_port_range            = each.value.source_port_range
  source_port_ranges           = each.value.source_port_ranges
  destination_port_range       = each.value.destination_port_range
  destination_port_ranges      = each.value.destination_port_ranges
  source_address_prefix        = each.value.source_address_prefix
  source_address_prefixes      = each.value.source_address_prefixes
  destination_address_prefix   = each.value.destination_address_prefix 
  destination_address_prefixes = each.value.destination_address_prefixes
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.log_analytics_workspace_id == null ? 0 : 1
  name                       = "logs-metrics-2-workspace"
  target_resource_id         = azurerm_network_security_group.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id 
  log {
    category_group = "allLogs"
    retention_policy {
      enabled = false
      days = 0
    }
  }
}
