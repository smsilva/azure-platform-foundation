output "platform_name" {
  value = var.platform_name
}

output "instance_names" {
  value = values(module.platform_instances)[*].instance_name
}

output "instance_list" {
  value = values(module.platform_instances)[*]
}

output "instance_base_list" {
  value = flatten([
    for id, name in var.instance_list : [
      {
        id     = var.instance_list[id].id
        name   = var.instance_list[id].name
        region = var.instance_list[id].region
      }
    ]
  ])
}
