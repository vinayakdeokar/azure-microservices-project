variable "rg_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
}

variable "tags" {
  description = "Common tags applied to resources"
  type        = map(string)
}
