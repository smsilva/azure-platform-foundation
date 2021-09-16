output "platform_name" {
  value = var.platform_name
}

output "instance_list" {
  value = values(module.platform_instances)[*].instance_name
}

output "instances_map" {
  value = module.platform_instances
}

output "platform_eventgrid_topic_endpoint" {
  value     = module.platform_eventgrid_topic.instance.endpoint
  sensitive = true
}

output "platform_eventgrid_topic_primary_access_key" {
  value     = module.platform_eventgrid_topic.instance.primary_access_key
  sensitive = true
}
