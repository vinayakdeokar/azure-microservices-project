# ---------------------------------------
# Resource Group Variables
# ---------------------------------------
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

# ---------------------------------------
# Azure Container Registry Variables
# ---------------------------------------
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  type        = string
}

# ---------------------------------------
# Azure Kubernetes Service Variables
# ---------------------------------------
variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
}

# ---------------------------------------
# Networking Variables
# ---------------------------------------
variable "prefix" {
  description = "Prefix used for naming networking resources"
  type        = string
}

# variable "vnet_space" {
#   description = "Address space for the Virtual Network"
#   type        = list(string)
# }

variable "service_cidr" {
  description = "AKS service CIDR"
  type        = string
}

variable "dns_service_ip" {
  description = "AKS DNS service IP"
  type        = string
}
variable "subnets" {
  description = "VNet subnets"
  type        = map(string)
}
variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

# ---------------------------------------
# Common Tags
# ---------------------------------------
variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}
# ---------------------------------------
# AKS Cluster Configuration
# ---------------------------------------

variable "kubernetes_version" {
  description = "AKS Kubernetes version"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in default node pool"
  type        = number
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
}

variable "project" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}
variable "keyvault_name" {
  description = "Azure Key Vault Name"
  type        = string
}

variable "autoscaler_nodepool_name" {
  description = "AKS autoscaler node pool name"
  type        = string
}

variable "autoscaler_min_nodes" {
  description = "Minimum nodes for autoscaler"
  type        = number
}

variable "autoscaler_max_nodes" {
  description = "Maximum nodes for autoscaler"
  type        = number
}
