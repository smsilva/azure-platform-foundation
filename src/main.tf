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
  source   = "../modules/instance"
  for_each = local.instances

  platform_name = var.platform_name
  id            = each.value.id
  name          = each.value.name
  region        = each.value.region
}
