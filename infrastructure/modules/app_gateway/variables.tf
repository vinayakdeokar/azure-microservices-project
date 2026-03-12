variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "appgw_subnet_id" {
  type = string
}
variable "tags" {
  type = map(string)
}

variable "duckdns_domain" {
  type        = string
  description = "The Duck DNS subdomain (e.g., ecom-store-vd)"
}

variable "duckdns_token" {
  type        = string
  description = "The Duck DNS token"
  sensitive   = true
}
