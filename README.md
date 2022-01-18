# terraform-vcd-poc
Terraform with VMware Cloud Director Provider PoC

### Instalar el provider vcd (solo es necesario la instalacion the built provider)
https://github.com/vmware/terraform-provider-vcd

### Para que funcione con kio networks es necesario que añadan la ip publica al whitelist
### La vcd_url de kionetworks es:
```
variable "vcd_url" {
  description = "vcd_url"
  default = "https://go1kloud.kionetworks.es/api"
}
```

### Ejemplos
https://developer.vmware.com/samples/7210/vcd-terraform-examples

### Comandos
```
terraform init
terraform plan
terraform apply
terraform destroy
```
