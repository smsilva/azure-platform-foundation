output "id" {
  value = azurerm_eventgrid_topic.foundation.id
}

output "name" {
  value = azurerm_eventgrid_topic.foundation.name
}

output "instance" {
  value     = azurerm_eventgrid_topic.foundation
  sensitive = true
}
