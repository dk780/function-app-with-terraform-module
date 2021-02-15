resource "azurerm_network_security_group" "tfnsg" {
  name                = var.nsgname                        
  location            = var.resourceglocation                    
  resource_group_name = var.resourcegrpname           
}