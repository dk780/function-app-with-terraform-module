variable "resourcegrpname" {
  description = "Resource Group Name"
}
variable "resourceglocation" {
  description = "Location"
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
  description = "Function app service plan name"
  default = "dipakstorage"
}

variable "storage_account_access_key" {
  description = "Function app service plan name"
  default = ""
}