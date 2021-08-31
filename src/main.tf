resource null_resource "foundation" {

}

module "environment" {
  source = "../modules/environment"

  name = "sandbox"
}
