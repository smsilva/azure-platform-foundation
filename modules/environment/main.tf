variable "name" {
  type        = string
  description = "Environment Name"
  default     = "bacurau"
}

resource "null_resource" "environment" {
  triggers = {
    name = var.name
  }
}

resource "random_string" "environment_id" {
  length      = 6
  special     = false
  upper       = false
  min_numeric = 3
}

output "name" {
  value = "${null_resource.environment.triggers.name}-${random_string.environment_id.result}"
}
