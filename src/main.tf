data "azurerm_resource_group" "foundation" {
  name = "${var.platform_name}-foundation"
}

locals {
  instances = {
    for instance in var.instance_list : "${instance.id}-${instance.name}" => {
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
