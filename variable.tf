#do not define sensitive data, make use of hcp cloud for it

variable "billing" {
  description = "cost center"
  type        = string
  default     = "it_network"
}


variable "org" {
  description = "org"
  type        = string
  default     = "company1"
}

variable "org-1" {
  description = "org-1"
  type        = string
  default     = "company1"
}

variable "org-2" {
  description = "org-2"
  type        = string
  default     = "company1"
}



variable "primary-dc-location" {
  description = "resource location"
  type        = string
  default     = "eastus2"
}