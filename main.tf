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
# the two text fields are the resource type and the local resource name to be referenced in this file
# these are combined for the ID - azurerm_resource_group.rg
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "uksouth"
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

# adding vnet to be contained within the rg
# terraform recognises the dependency and creates the resources in order
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-terraform-learn"
  address_space       = ["10.0.0.0/16"]
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_storage_account" "sa" {
  name                     = "saterraformlearn"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sc" {
  name                  = "container"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}