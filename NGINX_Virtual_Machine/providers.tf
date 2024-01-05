terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = ">= 2.0"
        }
        random = {
            source  = "hashicorp/random"
            version = ">= 3.0"
        }
    }
}

provider "azurerm" {
    # this is needed due to UDF restrictions
    skip_provider_registration = true
   subscription_id = var.subscription_id
   client_id = var.client_id
   client_secret = var.client_secret
   tenant_id = var.tenant_id
   features {}
}
