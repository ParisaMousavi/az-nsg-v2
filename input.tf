variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "additional_tags" {
  default = {}
  type    = map(string)
}

variable "security_rules" {
  type = list(object({
    name                         = string
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    source_port_range            = string
    source_port_ranges           = string
    destination_port_range       = string
    destination_port_ranges      = string
    source_address_prefix        = string
    source_address_prefixes      = string
    destination_address_prefix   = string
    destination_address_prefixes = string
    description                  = string
  }))
  default = null
}
