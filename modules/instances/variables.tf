variable "platform_name" {
  type        = string
  description = "Platform Name"
}

variable "instance_list" {
  type = map(object({
    id   = string
    name = string
  }))
}
