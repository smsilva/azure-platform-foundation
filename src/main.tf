locals {
  instances = {
    for instance in var.instance_list : "${instance.id}-${instance.name}" => instance
  }
}

data "azurerm_resource_group" "foundation" {
  name = var.resource_group_name
}

resource "azurerm_automation_account" "platform" {
  name                = "${var.platform_name}-configuration-management"
  location            = data.azurerm_resource_group.foundation.location
  resource_group_name = data.azurerm_resource_group.foundation.name
  sku_name            = "Basic"

  tags = {
    foundation = true
    terraform  = true
    component  = "Configuration Registry"
  }
}

module "instances" {
  source        = "../modules/instances"
  instance_list = local.instances
  platform_name = var.platform_name

  depends_on = [
    azurerm_automation_account.platform
  ]
}

resource "azurerm_automation_variable_string" "instance" {
  for_each = module.instances.list

  name                    = "instance|${each.value.name}"
  resource_group_name     = data.azurerm_resource_group.foundation.name
  automation_account_name = azurerm_automation_account.platform.name
  value                   = each.value.name
}
