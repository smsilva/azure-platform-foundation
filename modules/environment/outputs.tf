output "name" {
  value = "${null_resource.environment.triggers.name}-${random_string.environment_id.result}"
}
