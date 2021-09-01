output "name" {
  value = "${local.name}-${random_string.environment_id.result}"
}

output "test" {
  value = random_string.environment_id.keepers.name
}
