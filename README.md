# terraform-vcd-poc
Terraform with VMware Cloud Director Provider PoC

## Requirements
### Install terraform on linux
https://learn.hashicorp.com/tutorials/terraform/install-cli
### Install vcd provider (requires terraform cli) (go to -> Using the provider)
https://github.com/vmware/terraform-provider-vcd
when terraform init, you need to use the specific version installed under:
`$HOME/.terraform.d/plugins/registry.terraform.io/vmware/vcd/${VERSION}/${OS}_amd64/terraform-provider-vcd_v${VERSION}`
Add that version to the main.tf, after that, next terraform init will success!
test with:
```
terraform init
```
### Whitelist IP
Para que funcione con kio networks es necesario que añadan la ip publica al whitelist
La vcd_url de kionetworks es:
```
variable "vcd_url" {
  description = "vcd_url"
  default = "https://go1kloud.kionetworks.es/api"
}
```
## Official documentation
https://registry.terraform.io/providers/vmware/vcd/latest/docs

## Examples
https://developer.vmware.com/samples/7210/vcd-terraform-examples
https://github.com/tschoergez/vcd-terraform-examples/blob/master/tenant/main.tf

## Commands
```
terraform init
terraform plan
terraform apply
terraform destroy
```
