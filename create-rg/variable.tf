variable "rgs" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
  default = {
    "first" = {
      name     = "first_rg"
      location = "west us"
      tags = {
        "owner"    = "Ire"
        "downtime" = "afternoon"
      }
    },
    "second" = {
      name     = "second_rg"
      location = "east us"
      tags = {
        "owner"    = "Damola"
        "downtime" = "morning"
      }
    },
    "third" = {
      name     = "third_rg"
      location = "uksouth"
      tags = {
        "owner"    = "Ade"
        "downtime" = "Evening"
      }
    }
  }
}


