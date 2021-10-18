variable "vcd_user" {
  description = "vcd_user"
  default = "ahernandez"
}
variable "vcd_pass" {
  description = "vcd_pass"
  default = "PASSWORD"
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
  default = "URL"
}
variable "vcd_max_retry_timeout" {
  description = "vcd_max_retry_timeout"
  default = 10
}
variable "vcd_allow_unverified_ssl" {
  description = "vcd_allow_unverified_ssl"
  default = false
}