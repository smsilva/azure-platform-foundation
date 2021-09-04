locals {
  instance_base_name = "${var.platform_name}-${var.name}"
}

resource "random_string" "instance_id" {
  keepers = {
    id   = var.id
    name = local.instance_base_name
  }

  length      = 6
  min_numeric = 3
  special     = false
  upper       = false
}
