 ## Apply mapping ##
  resource "azurerm_virtual_machine" "vm" {
  tags           = var.tags
  }
  
  resource "azurerm_virtual_machine" "vm" {
  vm_size               = var.sizes["medium"]
  # This is similar, but uses `lookup`:
  # vm_size             = lookup(var.sizes, "medium")
  }

resource "azurerm_virtual_machine" "vm" {
  vm_size               = var.sizes[size]
}

## Count ##

resource "azurerm_resource_group" "example" {
  count    = 3
  name     = "example-${count.index}"
  location = "West Europe"
}

## For each ##
resource "azurerm_resource_group" "example" {
for_each = var.rg
 name    = each.value.name
}