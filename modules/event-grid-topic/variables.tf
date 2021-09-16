variable "company_name" {
  type        = string
  description = "Company Name"
}

variable "platform_name" {
  type        = string
  description = "Platform Name"
}

variable "platform_key_vault_name" {
  type        = string
  description = "Platform Key Vault Name"
}

variable "resource_group" {
  type = object({
    id       = string
    name     = string
    location = string
  })
}
