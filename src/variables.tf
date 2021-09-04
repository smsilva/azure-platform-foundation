variable "platform_name" {
  description = "Platform Name to be used as prefix for each Platform Instance"
  type        = string
}

variable "instance_list" {
  description = "Platform Instance List"
  type = list(object({
    id     = string
    name   = string
    region = string
  }))
}
