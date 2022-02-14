variable "resource_group_name" {
  default = "AdeResourceGroup"
}

variable "tags" {
  type = map(string)
  default = {
     Environment = "learn-tf"
    Team = "CloudVille"
    Administrator = "Ade"
  }
}
