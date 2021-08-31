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
