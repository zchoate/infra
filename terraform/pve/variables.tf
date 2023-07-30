variable "servers" {}
variable "base_vm" {}
variable "pihole_url" {
    description = "URL to PiHole server."
}
variable "pihole_token" {
    description = "API token for PiHole"
}
variable "local_domain" {
    description = "Domain to append to hosts for your FQDN. Eg. `host.home.local`"
}