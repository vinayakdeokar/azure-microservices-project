variable "cluster_name" {
  description = "AKS cluster name"
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

variable "vnet_subnet_id" {
  description = "Subnet ID for AKS nodes"
  type        = string
}

variable "kubernetes_version" {
  description = "AKS Kubernetes version"
  type        = string
}

variable "node_count" {
  description = "Initial node count"
  type        = number
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}
