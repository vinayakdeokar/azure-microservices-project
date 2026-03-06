variable "kubernetes_version" {
  description = "AKS Kubernetes version"
  type        = string
}

variable "node_count" {
  description = "AKS node count"
  type        = number
}

variable "vm_size" {
  description = "AKS node VM size"
  type        = string
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "vnet_subnet_id" {
  type = string
}

variable "tags" {
  type = map(string)
}
