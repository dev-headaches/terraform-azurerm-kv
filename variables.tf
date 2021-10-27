variable "enviro" {
  type        = string
  description = "define the environment ex. dev,tst,prd,stg"
}

variable "prjnum" {
  type        = string
  description = "define the project number for TFstate file ex. 4858"
}

variable "location" {
  type        = string
  description = "location of your resource group"
}

variable "usecase" {
  type         = string
  default = ""
  description = "description of what the keyvault will be used for ex. 'vmpasswords'"
}

variable "orgname" {
  type         = string
  default = ""
  description = "name of the organization the kv is being deployed for"
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