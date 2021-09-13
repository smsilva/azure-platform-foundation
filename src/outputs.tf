output "platform_name" {
  value = var.platform_name
}

output "instance_list" {
  value = values(module.platform_instances)[*].instance_name
}

output "instances_map" {
  value = module.platform_instances
}

output "platform_eventgrid_topic" {
  value     = module.platform_eventgrid_topic
  sensitive = true
}
