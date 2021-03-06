variable "company_name" {
  type        = string
  description = "Company Name"
}

variable "platform_name" {
  type        = string
  description = "Platform Name to be used as prefix for each Platform Instance"
}

variable "platform_key_vault_name" {
  type        = string
  description = "Platform Key Vault Name"
}

variable "platform_instance_list" {
  type = list(object({
    id     = string
    name   = string
    region = string
  }))
  description = "Platform Instance List is a base for generate unique names for each Instance as Outputs"
}
