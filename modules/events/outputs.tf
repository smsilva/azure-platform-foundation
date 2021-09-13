output "eventgrid_topic" {
  value     = azurerm_eventgrid_topic.foundation
  sensitive = true
}
