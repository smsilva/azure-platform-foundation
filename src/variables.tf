variable "platform_name" {
  description = "Platform Name to be used as prefix for each Platform Instance"
  type        = string
}

variable "instance_list" {
  description = "Platform Instance List"
  type = list(object({
    id   = string
    name = string
  }))
}

variable "resource_group_name" {
  type        = string
  description = "Platform Foundation Resource Group Name"
}

variable "resource_group_location" {
  type        = string
  description = "Platform Foundation Resource Group Location"
  default     = "centralus"
}
