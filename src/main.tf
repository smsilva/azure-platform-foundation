resource "null_resource" "foundation" {
}

module "environment" {
  source   = "../modules/environment"
  for_each = toset(var.environments_list)

  name = each.value
}
