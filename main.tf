module "rg" {
  source   = "./modules/Resource_Group"
  name     = var.rg_name
  location = var.rg_location

}


module "Subnet" {
  source               = "./modules/Subnets"
  name                 = "subnet-${count.index}"
  count                = 1
  resource_group_name  = module.rg.name
  virtual_network_name = module.vnet.name
  address              = [var.address[count.index]]
}

module "vnet" {
  source              = "./modules/Virtual_Network"
  name                = var.vnet_name
  resource_group_name = module.rg.name
  location            = var.rg_location
  address_space       = var.address_space

}

module "publicip" {
  source                  = "./modules/Public_Ip"
  name                    = "var.pip_name.${count.index}"
  count =3 
  location                = var.rg_location
  resource_group_name     = module.rg.name
  allocation_method       = var.pip_allocation_method
  idle_timeout_in_minutes = 30
}


module "network_interface" {
  source                        = "./modules/Network_Interface"
  name                          = "var.interface_name.${count.index}"
  count = 3
  location                      = module.rg.location
  resource_group_name           = module.rg.name
  public_ip_id                  = module.publicip.*.public_ip_id[count.index]
  subnet_id                     = module.Subnet[0].subnet_id
  private_ip_address_allocation = var.private_allocation_method
}

module "SG" {
  source                     = "./modules/NSG"
  name                       = var.sg_name
  location                   = module.rg.location
  resource_group_name        = module.rg.name
  priority                   = var.priority
  direction                  = var.direction
  access                     = var.access
  protocol                   = var.protocol
  source_port_range          = var.source_port_range
  destination_port_range     = var.destination_port_range
  source_address_prefix      = var.source_address_prefix
  destination_address_prefix = var.destination_address_prefix

}

module "nsg-association" {
  source                     = "./modules/NSG_Association"
  subnet_id = module.Subnet[0].subnet_id
  network_security_group_id = module.SG.sg_id
}


module "VM"{
    source              = "./modules/Virtual_Machine"
    name                = "es-${count.index}"
    count = 3
    resource_group_name = module.rg.name
    location            = module.rg.location
    size                = var.size
    admin_username      = var.admin_username
    network_interface_ids = module.network_interface.*.interface_id[count.index]
    public_key = file("~/.ssh/id_rsa.pub")
    caching              = var.caching
    storage_account_type = var.storage_account_type
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    
 

}

module "Managed_Disk" {
  source              = "./modules/Managed_Disk"
  name                 = "var.disk_name.${count.index}"
  count = 3
  location             = module.rg.location
  resource_group_name  = module.rg.name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
}

module "Managed_Disk_Attach" {
  source              = "./modules/Disk_Attachment"
  count = 3
   managed_disk_id                = module.Managed_Disk.*.Managed_Disk_ID[count.index]
  virtual_machine_id            = module.VM.*.vm_id[count.index]
  lun =               var.lun
  caching = var.caching
}









 