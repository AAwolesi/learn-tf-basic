variable "resource_group_name" {
  default     = "ade-rg"
  description = "Resource group"
}
variable "location" {
  type        = string
  description = "Location of the VM"
}

variable "admin_username" {
  type        = string
  description = "VM Username"
}
variable "admin_password" {
  type        = string
  description = "The password of log into the VM"
}
variable "size" {
  type        = string
  description = "The size of the VM"
}

variable "vm" {
  type = map(object({
    name                     = string
    vm_size                  = string
    os_disk_caching          = string
    os_disk_storage_acc_type = string
    source_image_publisher   = string
    source_image_offer       = string
    source_image_sku         = string
    source_image_version     = string
    zone = string
  }))
  description = "decription of VM objects"
}

variable "tags" { 
    type =  map (string)
    description = "tags to apply on resource"
}