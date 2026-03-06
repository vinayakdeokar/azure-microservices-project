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
