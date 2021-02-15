resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.func_app_service_plan
  resource_group_name = var.resourcegrpname
  location            = var.resourceglocation
  kind                = "FunctionApp"
  reserved = true
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "function_app" {
  name                       = var.function_app_name
  resource_group_name        = var.resourcegrpname
  location                   = var.resourceglocation
  app_service_plan_id        = azurerm_app_service_plan.app_service_plan.id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key

  
}