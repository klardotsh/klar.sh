resource "vultr_ssh_key" "my_ssh_key" {
  name    = "klardotsh-1"
  ssh_key = trimspace(file("../resources/id_rsa.pub"))
  # ^ trimspace avoids a discrepancy between TF plan and actual state - Vultr
  # trims these server-side, and not trimming here results in a diff in the
  # plan on *every* deploy. noisy!
}

resource "vultr_iso_private" "void_x8664_musl" {
  url = "https://alpha.de.repo.voidlinux.org/live/current/void-live-x86_64-musl-20191109.iso"
}

resource "vultr_reserved_ip" "eip_v4" {
  label     = "eip_v4-1"
  region_id = data.vultr_region.amsterdam.id
  ip_type   = "v4"
}

resource "vultr_network" "klardotsh_vpc" {
  description = "klardotsh's VPC"
  region_id   = data.vultr_region.amsterdam.id
  cidr_block  = "10.0.0.0/24"
}
