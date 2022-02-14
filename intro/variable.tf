## Examples of List ##

variable "weblocations" {
    default = [ "francecentral", "canadaeast", "brazilsouth", "japanwest" ]
}

## Example of Map ###

variable "tags" {
    type = "map"
    default = {
        environment = "production"
        owner      = "Ade"
    }
}

variable "sizes" {
  default = {
    small   = "Standard_DS1_v2"
    medium  = "Standard_DS2_v2"
    large   = "Standard_DS3_v2"
  }
}

variable "size" {
  default = "medium"
}

## For each ##

rg = {
  ADis = {
    name  = "ADS"
    location = "westurope"
  }
  alove = {
    name  = "BAstop"
    location = "easteurope"
  }
  }

