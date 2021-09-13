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

module "platform_instances" {
  source   = "../modules/platform_instance"
  for_each = local.instances

  platform_name                 = var.platform_name
  platform_instance_internal_id = each.value.id
  platform_instance_name        = each.value.name
  platform_instance_region      = each.value.region
}

module "platform_eventgrid_topic" {
  source = "../modules/events"

  company_name            = var.company_name
  platform_name           = var.platform_name
  platform_key_vault_name = var.platform_key_vault_name
}
