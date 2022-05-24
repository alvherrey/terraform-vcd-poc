# Necesario para descargar el provider al hacer terraform init
terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.6.0"
    }
  }
}

# Configure the VMware Cloud Director Provider
provider "vcd" {
  user                 = var.vcd_user
  password             = var.vcd_pass
  auth_type            = "integrated"
  org                  = var.vcd_org
  vdc                  = var.vcd_vdc
  url                  = var.vcd_url
  max_retry_timeout    = var.vcd_max_retry_timeout
  allow_unverified_ssl = var.vcd_allow_unverified_ssl
}

# ## vcd_org_user
# resource "vcd_org_user" "alvaro" {
#   org = var.vcd_org

#   name        = "alvaro"
#   description = "a new org admin"
#   role        = "Organization Administrator"
#   password    = "alvaro"
# }

## vcd_catalog - catalogo contenedor de imagenes iso
resource "vcd_catalog" "myNewCatalog" {
  org = var.vcd_org

  name             = "my-catalog"
  description      = "catalog for files"
  delete_recursive = "true"
  delete_force     = "true"
}

## vcd_catalog_media - imagen iso
resource "vcd_catalog_media" "myNewMedia" {
  org = var.vcd_org
  catalog = vcd_catalog.myNewCatalog.name

  name                 = "ubuntu-20.04.3-live-server-amd64"
  description          = "new os versions"
  media_path           = "ubuntu-20.04.3-live-server-amd64.iso"
  upload_piece_size    = 10
  show_upload_progress = true

  metadata = {
    license = "public"
    version = "v1"
  }
}

## vcd_network_isolated_v2
resource "vcd_network_isolated_v2" "nsxt-backed" {
  org = var.vcd_org
  vdc = var.vcd_vdc

  name        = "nsxt-isolated-1"
  description = "My isolated Org VDC network backed by NSX-T"

  gateway       = "192.168.1.1"
  prefix_length = 24

  static_ip_pool {
    start_address = "192.168.1.10"
    end_address   = "192.168.1.20"
  }

  static_ip_pool {
    start_address = "192.168.1.110"
    end_address   = "192.168.1.120"
  }
}

## vcd_vapp
resource "vcd_vapp" "web" {
  org = var.vcd_org
  vdc = var.vcd_vdc
  power_on = false
  
  name = "web"

  metadata = {
    boss = "Why is this vApp empty?"
    john = "I don't really know. Maybe somebody did forget to clean it up."
  }
}

## vcd_vapp_network
resource "vcd_vapp_network" "vappNet" {
  org = var.vcd_org
  vdc = var.vcd_vdc

  name               = "my-net"
  vapp_name          = vcd_vapp.web.name
  gateway            = "192.168.2.1"
  netmask            = "255.255.255.0"
  dns1               = "192.168.2.1"
  dns2               = "192.168.2.2"
  dns_suffix         = "mybiz.biz"
  guest_vlan_allowed = true

  static_ip_pool {
    start_address = "192.168.2.51"
    end_address   = "192.168.2.100"
  }

  dhcp_pool {
    start_address = "192.168.2.2"
    end_address   = "192.168.2.50"
  }
}

## vcd_independent_disk
resource "vcd_independent_disk" "myNewIndependentDisk" {
  vdc             = var.vcd_vdc
  name            = "logDisk"
  size_in_mb      = "16384"
  bus_type        = "SCSI"
  bus_sub_type    = "VirtualSCSI"
}

## vcd_vapp_vm
resource "vcd_vapp_vm" "web1" {
  vapp_name = vcd_vapp.web.name
  name      = "web1"

  catalog_name  = vcd_catalog.myNewCatalog.name
  template_name = vcd_catalog_media.myNewMedia.name

  memory = 2048
  cpus   = 1

  network {
    type               = "vapp"
    name               = vcd_vapp_network.vappNet.name
    ip_allocation_mode = "POOL"
  }

  disk {
    name        = vcd_independent_disk.myNewIndependentDisk.name
    bus_number  = 1
    unit_number = 0
  }
}

# ## vcd_vm
# resource "vcd_vm" "TestVm" {
#   name = "TestVm"

#   catalog_name  = vcd_catalog.myNewCatalog.name
#   template_name = vcd_catalog_media.myNewMedia.name
#   cpus          = 2
#   memory        = 2048

#   network {
#     type               = "none"
#     name               = vcd_vapp_network.vappNet.name
#     ip_allocation_mode = "POOL"
#   }

#   disk {
#     name        = vcd_independent_disk.myNewIndependentDisk.name
#     bus_number  = 1
#     unit_number = 0
#   }
# }