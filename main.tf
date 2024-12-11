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
  name     = var.resource_group_name
  location = "westus2"
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

# adding vnet to be contained within the rg
# terraform recognises the dependency and creates the resources in order
resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
}