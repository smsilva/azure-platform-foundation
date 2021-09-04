variable "platform_name" {
  type        = string
  description = "Platform Name"
}

variable "id" {
  type        = string
  description = "Instance Internal ID allowing to use the same name with different random ID values"
}

variable "name" {
  type        = string
  description = "Instance Base Name"
}

variable "region" {
  type        = string
  description = "Instance Resource Group Location"
}
