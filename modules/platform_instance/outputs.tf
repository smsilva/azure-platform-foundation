output "instance_name" {
  value = azurerm_resource_group.default.name
}

output "instance_region" {
  value = azurerm_resource_group.default.location
}

output "instance_resource_group_id" {
  value = azurerm_resource_group.default.id
}
