variable "environments_list" {
  default = [
    "sandbox",
    "staging",
    "production"
  ]
}

variable "environments_tuple_1" {
  default = [
    { id = 100, name = "sandbox" },
    { id = 200, name = "staging" },
    { id = 300, name = "production" },
  ]
}

variable "environments_tuple_2" {
  default = [
    { sandbox = { id = 100, name = "sandbox" } },
    { staging = { id = 200, name = "staging" } },
    { production = { id = 300, name = "production" } },
  ]
}

//output "list" {
//  value = [for environment_name in var.environments : environment_name]
//}
//
//output "list-1" {
//  value = {
//    for key, value in var.environments : key => value.name
//  }
//}
//
//output "list-2" {
//  value = {
//    for environment in var.environments : "${environment.name}-${environment.number}" => environment
//  }
//}
//
//output "list-3" {
//  value = {
//    for environment in var.environments : "${environment.name}" => environment.number
//  }
//}
