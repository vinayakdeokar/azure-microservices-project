variable "nodepool_name" {
  description = "AKS node pool name"
  type        = string
}

variable "aks_id" {
  description = "AKS cluster id"
  type        = string
}

variable "vm_size" {
  description = "VM size"
  type        = string
}

variable "min_nodes" {
  description = "Minimum nodes"
  type        = number
}

variable "max_nodes" {
  description = "Maximum nodes"
  type        = number
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
}
