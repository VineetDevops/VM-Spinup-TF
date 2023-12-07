variable "resource_group_name" {
  type = string
}

variable "vnet_location" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(any)
}

variable "rg_location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "address" {
  type = list(any)
}

variable "pip_name" {
  type = string
}

variable "pip_allocation_method" {
  type = string
}

variable "pip_idle_timeout_in_minutes" {
  type = string
}

variable "config_name" {
  type = string
}

variable "interface_name" {
  type = string
}


variable "private_allocation_method" {
  type = string
}

variable "sg_name" {
  type = string
}
variable "priority" {
  type = string
}

variable "direction" {
  type = string
}

variable "access" {
  type = string
}

variable "protocol" {
  type = string
}

variable "source_port_range" {
  type = string
}

variable "destination_port_range" {
  type = string
}

variable "source_address_prefix" {
  type = string
}

variable "destination_address_prefix" {
  type = string
}

# variable "vm_name" {
# type = list  
# }

variable "size" {
type = string  
}

variable "admin_username" {
type = string  
}


variable "publisher" {
type = string  
}

variable "offer" {
type = string  
}

variable "sku" {
type = string  
}

variable "disk_name" {
    type = string
  }

variable "storage_account_type" {
    type = string
  }

variable "create_option" {
    type = string
  }
variable "disk_size_gb" {
    type = number
  }

variable "lun" {
    type = string
  }

variable "caching" {
    type = string
  }