# Necesario para descargar el provider al hacer terraform init
terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.5.0"
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