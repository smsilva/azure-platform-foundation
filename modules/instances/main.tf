module "instance" {
  source   = "../instance"
  for_each = var.instance_list

  prefix = var.platform_name
  id     = each.value.id
  name   = each.value.name
}
