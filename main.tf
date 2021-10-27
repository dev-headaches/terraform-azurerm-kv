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
    environment = var.enviro
    prjnum = var.prjnum
    orgname = var.orgname
    usecase = var.usecase
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