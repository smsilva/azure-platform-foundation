output "instance_names" {
  value = values(module.instances.list)[*].name
}

output "azurerm_automation_account_name" {
  value = azurerm_automation_account.platform.name
}
