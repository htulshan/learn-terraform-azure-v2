terraform {
  cloud {

    organization = "terraform-tutotrials"

    workspaces {
      name = "learn-terraform-azure-v2"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.45.0"
    }
  }

  required_version = ">= 1.1.0"
}
