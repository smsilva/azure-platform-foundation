locals {
  instances = {
    for instance in var.instance_list : "${instance.id}-${instance.name}" => {
      id   = instance.id
      name = instance.name
    }
  }
}

module "instance" {
  source   = "../instance"
  for_each = local.instances

  platform_name = var.platform_name
  id            = each.value.id
  name          = each.value.name
}
