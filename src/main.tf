locals {
  instances = {
    for instance in var.instance_list : "${instance.id}-${instance.name}" => instance
  }
}

module "instance" {
  source   = "../modules/instance"
  for_each = local.instances

  id     = each.value.id
  prefix = var.platform_name
  name   = each.value.name
}

data "azurerm_resource_group" "foundation" {
  name = var.resource_group_name
}

resource "azurerm_automation_account" "platform" {
  name                = "${var.platform_name}-configuration-management"
  location            = data.azurerm_resource_group.foundation.location
  resource_group_name = data.azurerm_resource_group.foundation.name
  sku_name            = "Basic"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    foundation = true
    terraform  = true
    component  = "Configuration Registry"
  }
}

resource "azurerm_automation_variable_string" "instance" {
  for_each = module.instance

  name                    = "instance|${each.value.name}"
  resource_group_name     = data.azurerm_resource_group.foundation.name
  automation_account_name = azurerm_automation_account.platform.name
  value                   = each.value.name
}
