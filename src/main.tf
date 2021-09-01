data "azurerm_resource_group" "foundation" {
  name = var.resource_group_name
}

resource "azurerm_automation_account" "platform" {
  name                = "${var.platform_name}-configuration-management"
  location            = data.azurerm_resource_group.foundation.location
  resource_group_name = data.azurerm_resource_group.foundation.name
  sku_name            = "Basic"

  tags = {
    foundation = true
    terraform  = true
    component  = "Configuration Registry"
  }
}

module "instances" {
  source        = "../modules/instances"
  instance_list = var.instance_list
  platform_name = var.platform_name

  depends_on = [
    azurerm_automation_account.platform
  ]
}
