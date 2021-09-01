locals {
  name = "${var.platform_name}-${var.name}"
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
    prevent_destroy = false
  }
}

resource "azurerm_automation_variable_string" "instance" {
  name                    = "instance|${local.name}-${random_string.environment_id.result}|id"
  resource_group_name     = "${var.platform_name}-foundation"
  automation_account_name = "${var.platform_name}-configuration-management"
  value                   = "${local.name}-${random_string.environment_id.result}"
}
