locals {
  name = "${var.prefix}-${var.name}"
}

resource "random_string" "environment_id" {
  keepers = {
    id   = var.id
    name = local.name
  }
  length      = 6
  min_numeric = 3
  special     = false
  upper       = false

  lifecycle {
    prevent_destroy = true
  }
}
