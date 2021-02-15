# MSI keys , add this details to backend.tf file if there is any change in value
variable "subscription_id" {
  description = "Subscription ID"
  default     = "ed873cb3-9ca1-49a4-ba77-3405a6d50ab8"
}
variable "client_id" {
  description = "App Id"
  default     = "daeb73a7-2cf1-46d9-911a-88f03459a4a5"
}
variable "client_secret" {
  description = "Key for Service principal"
  default     = "pLTAF8uCzatmg6r-1b-_VTaprmy_0DdV1V"
}
variable "tenant_id" {
  description = "Tenant ID from AD"
  default     = "bde07727-35a5-419d-ac56-c87285c1dfee"
}


variable "resourcegrpname" {
  description = "Resource Group"
  default     = "resgroup-module-demo"
}
variable "resourceglocation" {
  description = "Location"
  default     = "West Europe"
}


# VNet variables
variable "vnet_name" {
  description = "Virtual network name"
  default     = "TFVnet"
}
variable "vnet_address_space" {
  description = "VNet address space"
  default     = ["10.0.0.0/16"]
}


#Subnet variables
variable "subnet_name" {
  description = "Subnet name"
  default     = "tfsubnet"
}
variable "subnet_address_prefixes" {
  description = "subnet address prefixes"
  default     = ["10.0.1.0/24"]
}

# Network security group variables
variable "nsgname" {
  description = "Network security group name "
  default     = "TFNSG"
}


#Load balancer variables
variable "lbipname" {
  description = "Load balancer IP name"
  default     = "TFPublicIPForLB"
}
variable "lbname" {
  description = "Load balancer name"
  default     = "TFLoadBalancer"
}

# VMSS variables
variable "vmss_name" {
  description = "virtual machine scaleset name"
  default     = "tf-vmss"
}
variable "vmss_name_prefix" {
  description = "virtual machine name prefix"
  default     = "tf-vmss"
}
variable "vmss_admin_username" {
  description = "virtual machine Admin user name"
  default     = "dipak"
}
variable "vmss_admin_password" {
  description = "virtual machine Admin user password"
  default     = "P@ssword1"
}
variable "vmss_key_path" {
  description = "RSA key path in local system"
  default     = "D:\\FunctioAppTF_MODULE\\terraform\\.ssh\\id_rsa.pub"
}

variable "function_app_name" {
  description = "Function app name"
  default = "tfFunctionApp"
}
variable "func_app_service_plan" {
  description = "Function app service plan name"
  default = "tfFunction_App_plan"
}

variable "storage_account_name" {
  description = "Storage account name"
  default = "dipakstorage"
}

variable "storage_account_access_key" {
  description = "Storage account access key"
  default = ""
}