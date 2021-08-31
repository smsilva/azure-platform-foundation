resource null_resource "foundation" {
}

module "environment" {
  source = "../modules/environment"

  name = "sandbox"
}

output "environment_name" {
  value = module.environment.name
}
