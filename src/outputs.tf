output "instance_names" {
  value = values(module.instance)[*].name
}

output "azurerm_automation_account_name" {
  value = azurerm_automation_account.platform.name
}
