terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.12"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.3.0"
    }
  }
}

resource "random_id" "keyvault" {
  prefix      = "kv"
  byte_length = "2"
}

resource "azurerm_key_vault" "keyvault" {
  name                        = format("%s%s%s%s", "kv-", var.keyvault_name, random_id.keyvault.hex, var.prjnum)
  location                    = var.location
  resource_group_name         = var.rgname
  enabled_for_disk_encryption = var.disk_encryption
  tenant_id                   = var.tenantid
  soft_delete_retention_days  = var.soft_del_days
  purge_protection_enabled    = var.prg_protect
  sku_name                    = var.sku
  tags = {
    Environment   = var.enviro
  }
  access_policy {
    tenant_id = var.tenantid
    object_id = var.clientuserid
    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "get", "list", "set", "Delete", "recover", "Backup", "restore", "purge"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

/*
resource "azurerm_key_vault_secret" "TFvmPasswdINPUT" {
  name         = "TFvmPasswd"
  value        = random_password.vmpasswd.result
  key_vault_id = azurerm_key_vault.kvTF.id
}


resource "azurerm_subnet_network_security_group_association" "snetassociation" {
  subnet_id                 = azurerm_subnet.dmzsubnet.id
  network_security_group_id = azurerm_network_security_group.dmzsubnetnsg.id
}

resource "azurerm_public_ip" "vmPubIP" {
  name                = "cloudskills-publicIP2"
  location            = var.location
  resource_group_name = azurerm_virtual_network.primaryvnet.resource_group_name
  allocation_method   = "Static"
  ip_version          = "IPv4"

  tags = {
    ProjectName   = var.prjname
    ProjectNumber = var.prjnum
    Environment   = var.enviro
    Stack         = "Networking"
  }
}
*/


/*
resource "azurerm_network_interface" "CloudskillsDevVM-nic" {
  name                = "CloudskillsDevVM-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.TheResourceGroup.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.cloudskills-sub.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.cloudskills-publicIP.id
  }
}

resource "azurerm_virtual_machine" "CloudskillsDevVM" {
  name                  = "cloudskillsvm"
  location              = azurerm_network_interface.CloudskillsDevVM-nic.location
  resource_group_name   = azurerm_resource_group.TheResourceGroup.name
  network_interface_ids = [azurerm_network_interface.CloudskillsDevVM-nic.id]
  vm_size               = var.vmsku
  
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "disk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "cloudskillsdev01"
    admin_username = "azureuser"
    admin_password = data.azurerm_key_vault_secret.TFvmPasswd.value
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "staging"
  }
}
*/