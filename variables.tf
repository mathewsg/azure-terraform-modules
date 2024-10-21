variable "location" {
  type        = string
  description = "The Resource group Location"
}

variable "name" {
  type        = string
  description = "Resource Group Name"
}

variable "tags" {
  type        = map(string)
  description = "Resource Group Tags"
}
