resource "null_resource" "environment" {
  triggers = {
    name = var.name
  }
}

resource "random_string" "environment_id" {
  length      = 6
  min_numeric = 3
  special     = false
  upper       = false
}
