output "platform_name" {
  value = var.platform_name
}

output "instance_names" {
  value = values(module.platform_instances)[*].instance_name
}
