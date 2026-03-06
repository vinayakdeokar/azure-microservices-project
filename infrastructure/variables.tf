variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "acr_name" { type = string }
variable "aks_name" { type = string }
variable "prefix" { type = string }
variable "vnet_space" { type = list(string) }
variable "subnet_prefix" { type = list(string) }
