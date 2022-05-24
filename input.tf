variable "vcd_user" {
  description = "vcd_user"
  default = "admin_onboarding"
}
variable "vcd_pass" {
  description = "vcd_pass"
  default = "0nb0ard1ng.2018"
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