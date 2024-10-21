variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "name" {
  type = string
}

variable "account_tier" {
  type = string
}

variable "replication_type" {
  type = string
}

variable "tags" {
  type = map(string)
}
