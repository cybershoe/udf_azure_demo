
# resource "azurerm_resource_group" "nginx" {
#   name     = "nginx"
#   location = "westus2"
# }

data "azurerm_resource_group" "nginx" {
  name = var.resource_group_name
}