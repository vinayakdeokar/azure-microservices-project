variable "keyvault_name" {
  description = "Name of Azure Key Vault"
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

variable "tenant_id" {
  description = "Azure tenant id"
  type        = string
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}
