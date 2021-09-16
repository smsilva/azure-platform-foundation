locals {
  platform_resource_group_name = "${var.platform_name}-foundation"

  # This will produce a Resource named like: "module.platform_instances["1000-sandbox"].azurerm_resource_group.default"
  instances = {
    for instance in var.platform_instance_list : "${instance.id}-${instance.name}" => {
      id     = instance.id
      name   = instance.name
      region = instance.region
    }
  }
}

data "azurerm_resource_group" "foundation" {
  name = "${var.platform_name}-foundation"
}

data "azurerm_key_vault" "foundation" {
  name                = var.platform_key_vault_name
  resource_group_name = data.azurerm_resource_group.foundation.name
}

module "platform_instances" {
  source   = "../modules/platform_instance"
  for_each = local.instances

  platform_name                 = var.platform_name
  platform_instance_internal_id = each.value.id
  platform_instance_name        = each.value.name
  platform_instance_region      = each.value.region
}

module "platform_eventgrid_topic" {
  source = "../modules/event-grid-topic"

  company_name            = var.company_name
  platform_name           = var.platform_name
  platform_key_vault_name = var.platform_key_vault_name
  resource_group          = data.azurerm_resource_group.foundation
}

resource "azurerm_key_vault_secret" "foundation" {
  key_vault_id = data.azurerm_key_vault.foundation.id
  name         = "event-grid-topic-${module.platform_eventgrid_topic.name}-primary-access-key"
  value        = module.platform_eventgrid_topic.instance.primary_access_key
}
