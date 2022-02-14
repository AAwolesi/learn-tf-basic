location = "westeurope"

admin_username = "ade"

admin_password = "AdeScop1!"

vm = {

  VM1 = {
    name                     = "ADS01"
    vm_size                  = "Standard_DS1_v2"
    os_disk_caching          = "ReadWrite"
    os_disk_storage_acc_type = "Standard_LRS"
    source_image_publisher   = "MicrosoftWindowsServer"
    source_image_offer       = "WindowsServer"
    source_image_sku         = "2019-Datacenter"
    source_image_version     = "latest"
    zone                     = "1"
  }

  VM2 = {
    name                     = "ADS02"
    vm_size                  = "Standard_DS1_v2"
    os_disk_caching          = "ReadWrite"
    os_disk_storage_acc_type = "Standard_LRS"
    source_image_publisher   = "MicrosoftWindowsServer"
    source_image_offer       = "WindowsServer"
    source_image_sku         = "2019-Datacenter"
    source_image_version     = "latest"
    zone                     = "2"
  }
}

tags = {
    Department  = "IT"
    Description = "learn-tf"
    Environment = "Prod"
}