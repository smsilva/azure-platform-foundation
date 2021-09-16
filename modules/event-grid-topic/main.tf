resource "random_string" "instance_id" {
  keepers = {
    company_name  = var.company_name
    platform_name = var.platform_name
  }

  length      = 3
  min_numeric = 1
  min_lower   = 1
  special     = false
  upper       = false
}

resource "azurerm_eventgrid_topic" "foundation" {
  name                = "${var.company_name}${var.platform_name}${random_string.instance_id.result}"
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
}
