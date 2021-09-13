data "azurerm_resource_group" "foundation" {
  name = "${var.platform_name}-foundation"
}

resource "random_string" "instance_id" {
  keepers = {
    company_name  = var.company_name
    platform_name = var.platform_name
  }

  length      = 3
  min_numeric = 1
  special     = false
  upper       = false
}

data "azurerm_key_vault" "foundation" {
  name                = var.platform_key_vault_name
  resource_group_name = data.azurerm_resource_group.foundation.name
}

resource "azurerm_eventgrid_topic" "foundation" {
  name                = "${var.company_name}${var.platform_name}${random_string.instance_id.result}"
  location            = data.azurerm_resource_group.foundation.location
  resource_group_name = data.azurerm_resource_group.foundation.name
}

resource "azurerm_key_vault_secret" "foundation_eventgrid_topic_primary_access_key" {
  key_vault_id = data.azurerm_key_vault.foundation.id
  name         = "${azurerm_eventgrid_topic.foundation.name}-primary-access-key"
  value        = azurerm_eventgrid_topic.foundation.primary_access_key
}
