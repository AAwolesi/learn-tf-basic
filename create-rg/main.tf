# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

## Resource Group ##

/*resource "azurerm_resource_group" "rgs1" {
  name     = "Tf-learn"
  location = "West Europe"
}
*/

## Resource Group for_each##
resource "azurerm_resource_group" "rgs" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
  tags = each.value.tags

}

## Resource Group Count ##

/*resource "azurerm_resource_group" "rgs1" {
  count = 3
  name     = "Tf-learns${count.index}"
  location = "West Europe"
}
*/