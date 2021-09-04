variable "platform_name" {
  type        = string
  description = "Platform Name"
}

variable "platform_instance_internal_id" {
  type        = string
  description = "Instance Internal ID allowing to use the same name with different random ID values"
}

variable "platform_instance_name" {
  type        = string
  description = "Instance Base Name"
}

variable "platform_instance_region" {
  type        = string
  description = "Instance Resource Group Location"
}
