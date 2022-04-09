# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "RG05"
  location = "Southeast Asia"
}

# Create virtual network
resource "azurerm_virtual_network" "myTerraFormNetwork" {
    name                = "virt_net_05"								## Virtual network name
    address_space       = ["10.0.0.0/16"]
    location            = "Southeast Asia"
    resource_group_name = "RG05"

    tags = {
        environment = "Terraform VNET"
    }
}
# Create subnet
resource "azurerm_subnet" "terraform_subnet" {
    name                 = "subnet05"
    resource_group_name = "RG05"
    virtual_network_name = azurerm_virtual_network.myTerraFormNetwork.name
    address_prefix       = "10.0.1.0/24"
}

#Deploy Public IP
resource "azurerm_public_ip" "pub_ip_resource" {
  name                = "publicip05"
  location            = "Southeast Asia"
  resource_group_name = "RG05"
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

# Create NIC
resource "azurerm_network_interface" "nic_resource" {
  name                = "nicname05"
  location            = "Southeast Asia"
  resource_group_name = "RG05"

    ip_configuration {
    name                          = "ipconfig05"
    subnet_id                     = azurerm_subnet.terraform_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pub_ip_resource.id
  }
}

# Create Boot Diagnostic Account
resource "azurerm_storage_account" "fileshare05" {                    # Storage Account Resource | aka File share
  name                     = "storeageaccount05"                      # Storage Account Name
  resource_group_name      = "RG05"
  location                 = "Southeast Asia"
   account_tier            = "Standard"
   account_replication_type = "LRS"

   tags = {
    environment = "Boot Diagnostic Storage"
    CreatedBy = "Admin"
   }
  }

# Create Virtual Machine
resource "azurerm_virtual_machine" "vm_resource" {
  name                  = "virt_machine05"
  location              = "Southeast Asia"
  resource_group_name   = "RG05"
  network_interface_ids = [azurerm_network_interface.nic_resource.id]
  vm_size               = "Standard_B1s"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk1"
    disk_size_gb      = "30"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "server05"
    admin_username = "adminacc"
    admin_password = "myPass_123"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

boot_diagnostics {
        enabled     = "true"
        storage_uri = azurerm_storage_account.fileshare05.primary_blob_endpoint
    }
}