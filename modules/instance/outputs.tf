output "name" {
  value = "${local.name}-${random_string.environment_id.result}"
}
