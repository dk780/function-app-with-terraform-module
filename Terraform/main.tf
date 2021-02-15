module "resource_group" {
  source     = "./modules/resource_group"
  resourcegrpname = var.resourcegrpname
  resourceglocation = var.resourceglocation
}

module "virtual_network" {
  source             = "./modules/virtual_network"
  resourcegrpname    = module.resource_group.rg_name
  resourceglocation  = var.resourceglocation
  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space
}

module "subnet" {
  source                  = "./modules/subnet"
  resourcegrpname         = module.resource_group.rg_name
  resourceglocation       = var.resourceglocation
  subnet_name             = var.subnet_name
  vnet_name               = var.vnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
  depends_on              = [module.virtual_network]
}

module "security_group" {
source     = "./modules/security_group"
resourcegrpname         = module.resource_group.rg_name
resourceglocation       = var.resourceglocation
nsgname    = var.nsgname
}

module "load_balancer" {
  source     = "./modules/load_balancer"
  resourcegrpname      = module.resource_group.rg_name
  resourceglocation    = var.resourceglocation
  lbname     = var.lbname
  lbipname   = var.lbipname
}

module "vmss" {
  source              = "./modules/vmss"
  resourcegrpname     = module.resource_group.rg_name
  resourceglocation   = var.resourceglocation
  vmss_name           = var.vmss_name
  vmss_name_prefix    = var.vmss_name_prefix
  vmss_admin_username = var.vmss_admin_username
  vmss_admin_password = var.vmss_admin_password
  vmss_subnet_id      = module.subnet.subnet_id
  vmss_lbaddrpool_id  = module.load_balancer.lbaddrpool_id
  vmss_lbnatpool_id   = module.load_balancer.lbnatpool_id
  vmss_key_path       = var.vmss_key_path
}

module "autoscaling" {
  source     = "./modules/autoscaling"
  resourcegrpname = module.resource_group.rg_name
  resourceglocation = var.resourceglocation
  vmss_id    = module.vmss.vmss_id
}

module "storage_account"{
    source = "./modules/storageaccount"
    storage_account_name = var.storage_account_name
    resourcegrpname = module.resource_group.rg_name
    resourceglocation = var.resourceglocation

}

module "function-app-with-plan" {
  source  = "./modules/functionapp"
  resourcegrpname = module.resource_group.rg_name
  resourceglocation = var.resourceglocation
  function_app_name = var.function_app_name
  func_app_service_plan = var.func_app_service_plan
  storage_account_name = module.storage_account.stg_account
  storage_account_access_key = module.storage_account.stg_account_key
}