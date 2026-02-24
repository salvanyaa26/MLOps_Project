terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {}
}

# 2.Resource Group 
resource "azurerm_resource_group" "mlops_rg" {
  name     = "rg-sentiment-ai-project"
  location = "Germany West Central" 
}

# 3. Container Registry (To store Docker Image)
resource "azurerm_container_registry" "mlops_acr" {
  name                = "acrsentimentai12345" # Must be globally unique
  resource_group_name = azurerm_resource_group.mlops_rg.name
  location            = azurerm_resource_group.mlops_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}