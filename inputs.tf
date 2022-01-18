variable "vcd_user" {
  description = "vcd_user"
  default = "<username>"
}
variable "vcd_pass" {
  description = "vcd_pass"
  default = "<password>"
}
variable "vcd_org" {
  description = "vcd_org"
  default = "IECI-ONBOARDING"
}
variable "vcd_vdc" {
  description = "vcd_vdc"
  default = "ONBOARDING_PRE"
}
variable "vcd_url" {
  description = "vcd_url"
  default = "https://go1kloud.kionetworks.es/api"
}
variable "vcd_max_retry_timeout" {
  description = "vcd_max_retry_timeout"
  default = 10
}
variable "vcd_allow_unverified_ssl" {
  description = "vcd_allow_unverified_ssl"
  default = false
}