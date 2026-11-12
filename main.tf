terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "my-webapp-rg"
  location = "francecentral"
}

# Deploy Container Instance using your Docker Hub image and credentials
resource "azurerm_container_group" "aci" {
  name                = "my-webapp-container"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  dns_name_label      = "my-webapp-dns-label"

  image_registry_credential {
    server   = "index.docker.io"
    username = "calibobo"
    password = "Theshield2014!"
  }

  container {
    name   = "webapp"
    image  = "calibobo/my-web-app:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}

output "container_fqdn" {
  value = azurerm_container_group.aci.fqdn
}