terraform {
  # Use a recent version of Terraform
  required_version = ">= 0.15"
  # Map providers to thier sources, required in Terraform 0.15+
  required_providers {
    azurerm = {
      # Azure Resource Manager 2.x (Base Azure RM Module)
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

    # Azure Active Directory 1.x (required for AKS and Azure AD Integration)
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 1.0"
    }

    # Random 3.x (Required to generate random names for Log Analytics Workspace)
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  # Terraform State Storage to Azure Storage Container
  # tfstate manage by azure
  backend "azurerm" {
  }
}

# This block is required for azurerm 2.x
provider "azurerm" {
  # v2.x azurerm requires "features" block
  features {
  }
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

# Create Random pet resource
resource "random_pet" "aksrandom" {

}