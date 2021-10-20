variable "enviro" {
  type        = string
  description = "define the environment ex. dev,tst,prd,stg"
}

variable "prjname" {
  type        = string
  description = "define the project name ex. prj02"
}

variable "prjnum" {
  type        = string
  description = "define the project number for TFstate file ex. 4858"
}

variable "location" {
  type        = string
  description = "location of your resource group"
}

variable "rgname" {
  type        = string
  description = "the name of the resource group in which to deploy the resource groups"
}

variable "tenantid" {
  type        = string
  description = "the name of the resource group in which to deploy the resource groups"
}

variable "clientuserid" {
  type        = string
  description = "the name of the resource group in which to deploy the resource groups"
}

variable "keyvault_name" {
  type        = string
}

variable "disk_encryption" {
  type        = bool
}

variable "soft_del_days" {
  type        = number
}

variable "prg_protect" {
  type        = bool
}

variable "sku" {
  type        = string
}