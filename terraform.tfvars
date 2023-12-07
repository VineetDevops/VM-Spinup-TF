vnet_name                   = "vnet1"
resource_group_name         = "prod_rg"
vnet_location               = "eastus"
address_space               = ["10.0.0.0/16"]
rg_name                     = "prod_module"
rg_location                 = "eastus"
address                     = ["10.0.1.0/24", "10.0.2.0/24"]
pip_name                    = "pip01"
pip_allocation_method       = "Static"
pip_idle_timeout_in_minutes = 30
config_name                 = "internal"
interface_name              = "vin01"
private_allocation_method   = "Dynamic"
sg_name                     = "sg01"
priority                    = 100
direction                   = "Inbound"
access                      = "Allow"
protocol                    = "Tcp"
source_port_range           = "*"
destination_port_range      = "*"
source_address_prefix       = "*"
destination_address_prefix  = "*"
#vm_name = "es"
size                = "Standard_F2"
admin_username      = "adminuser"
#username   = "adminuser"
caching              = "ReadWrite"
storage_account_type = "Standard_LRS"
publisher = "Canonical"
offer     = "UbuntuServer"
sku       = "16.04-LTS"
disk_name = "es_disk"
create_option        = "Empty"
disk_size_gb         = 10
lun =               "10"







