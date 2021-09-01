variable "platform_name" {
  type        = string
  description = "Platform Name"
}

variable "instance_list" {
  type = list(object({
    id   = string
    name = string
  }))
}
