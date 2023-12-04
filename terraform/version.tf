terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }

    # Use azuread provider to get current user object_id because it doesn't work with azurerm provider
    # https://github.com/hashicorp/terraform-provider-azurerm/issues/16982
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}
