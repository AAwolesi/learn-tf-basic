

resource "azurerm_windows_virtual_machine" "virtual_machine" {
  for_each                   = var.vm
  name                       = each.value.name
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = var.location
  size                       = each.value.vm_size
  admin_username             = var.admin_username
  admin_password             = var.admin_password
  zone                       = each.value.zone
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]
  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_acc_type
  }

  source_image_reference {
    publisher = each.value.source_image_publisher
    offer     = each.value.source_image_offer
    sku       = each.value.source_image_sku
    version   = each.value.source_image_version
  }
  tags = var.tags

}

resource "azurerm_network_interface" "nic" {
  for_each            = var.vm
  name                = each.value.name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = 
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
  }
}

