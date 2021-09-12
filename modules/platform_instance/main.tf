resource "random_string" "instance_id" {
  keepers = {
    platform_name                 = var.platform_name
    platform_instance_name        = var.platform_instance_name
    platform_instance_region      = var.platform_instance_region
    platform_instance_internal_id = var.platform_instance_internal_id
  }

  length      = 3
  min_numeric = 1
  special     = false
  upper       = false
}

locals {
  platform_instance_base_name           = "${var.platform_name}-${var.platform_instance_name}"
  platform_instance_name                = "${local.platform_instance_base_name}-${random_string.instance_id.result}"
  platform_instance_resource_group_name = "${local.platform_instance_base_name}-${random_string.instance_id.result}"
}

resource "azurerm_resource_group" "default" {
  name     = local.platform_instance_resource_group_name
  location = var.platform_instance_region

  tags = {
    platform_name               = var.platform_name
    platform_instance_name      = local.platform_instance_name
    platform_instance_base_name = local.platform_instance_base_name
  }
}
