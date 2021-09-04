output "instance_name" {
  value = "${local.instance_base_name}-${random_string.instance_id.result}"
}
