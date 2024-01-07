variable "subscription_id" {
   description = "Azure subscription"
   default = "3c1ebb50-50bc-471e-b4fd-937d3e2e758f"
}

variable "client_id" {
   description = "Azure Client ID"
   default = "420901b1-2da0-4252-b687-2a6913ccf2d8"
}

variable "client_secret" {
   description = "Azure Client Secret"
   default = "-iB8Q~dOEZqLBzuF3MRH_~v~KfNXj4B2y22bIbnL"
}

variable "tenant_id" {
   description = "Azure Tenant ID"
   default = "b88a044b-79b5-4c4a-af2d-0ffb279b0ebe"
}

variable "instance_size" {
   type = string
   description = "Azure instance size"
   default = "Standard_D2_v2"
}

variable "location" {
   type = string
   description = "Region"
   default = "West US"
}

variable "environment" {
   type = string
   description = "Environment"
   default = "dev"
}

variable "resource_group_name" {
  type = string
  description = "Name of the Azure Resource Group created by UDF"
  default = "cloudaccount-e19ee715-d9cf-48d5-b354-bbb09d483c1c"  
}
