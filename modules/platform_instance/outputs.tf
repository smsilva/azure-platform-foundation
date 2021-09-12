output "instance_id" {
  value = random_string.instance_id.result
}

output "instance_name" {
  value = azurerm_resource_group.default.name
}

output "instance_region" {
  value = azurerm_resource_group.default.location
}

output "instance_internal_id" {
  value = var.platform_instance_internal_id
}

output "instance_base_name" {
  value = var.platform_instance_name
}

output "instance_resource_group_id" {
  value = azurerm_resource_group.default.id
}
