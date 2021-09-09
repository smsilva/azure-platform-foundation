locals {
  instance_base_name = "${var.platform_name}-${var.platform_instance_name}"
}

resource "random_string" "instance_id" {
  keepers = {
    id   = var.platform_instance_internal_id
    name = local.instance_base_name
  }

  length      = 3
  min_numeric = 1
  special     = false
  upper       = false
}

resource "azurerm_resource_group" "default" {
  name     = "${local.instance_base_name}-${random_string.instance_id.result}"
  location = var.platform_instance_region

  tags = {
    platform_name               = var.platform_name
    platform_instance_name      = "${local.instance_base_name}-${random_string.instance_id.result}"
    platform_instance_base_name = var.platform_instance_name
  }
}
