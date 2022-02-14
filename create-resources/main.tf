# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westeurope"

  tags = var.tags
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "AdeVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "westeurope"
    resource_group_name = azurerm_resource_group.rg.name

    tags = var.tags
  }


resource "azurerm_virtual_network" "vnet1" {
    name                = "AdeVnet1"
    address_space       = ["10.1.0.0/16"]
    location            = "westeurope"
    resource_group_name = azurerm_resource_group.rg.name
    depends_on = [azurerm_virtual_network.vnet]
    tags = var.tags
  }

#Create Storage Account

resource "azurerm_storage_account" "example" {
  name                     = "adestorage1"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = "westeurope"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = var.tags
}

## Resource Group Level Lock

resource "azurerm_management_lock" "resource-group-level" {
  name       = "Cannot delete"
  scope      = azurerm_resource_group.rg.id
  lock_level = "CanNotDelete"
  notes      = "This Resource Group cannot be deleted"
}

#~ Virtual Machine

resource "azurerm_subnet" "adesubnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "ade-nic"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.adesubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = "AdeVM"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "westeurope"
  size                = "Standard_F2"
  admin_username      = "ade"
  admin_password      = "AdeScop1!"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"

  }
  tags = var.tags
}