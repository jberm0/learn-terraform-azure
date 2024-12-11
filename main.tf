# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm" #ref: https://registry.terraform.io/?product_intent=terraform
      version = "~> 3.0.2"          #ref: https://developer.hashicorp.com/terraform/language/providers/requirements
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

# each resource defines a component of the architecture
# the two text fields are the resource type and the resource name
# these are combined for the ID - azurerm_resource_group.rg
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}