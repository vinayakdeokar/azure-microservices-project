variable "prefix" {
  description = "Prefix used for resource naming"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
}
variable "subnets" {
  description = "subnet map"
  type        = map(string)
}

variable "environment" {
  description = "Environment name"
  type        = string
}


