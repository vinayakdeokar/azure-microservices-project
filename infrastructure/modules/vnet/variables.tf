variable "rg_name" {}
variable "location" {}
variable "prefix" {}
variable "vnet_address_space" { type = list(string) }
variable "subnet_address_prefix" { type = list(string) }
