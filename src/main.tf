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

module "platform_instances" {
  source   = "../modules/platform_instance"
  for_each = local.instances

  platform_name                 = var.platform_name
  platform_instance_internal_id = each.value.id
  platform_instance_name        = each.value.name
  platform_instance_region      = each.value.region
}
