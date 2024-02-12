resource "zerotier_network" "klardotsh" {
  name = "klardotsh"

  assignment_pool {
    start = "10.42.69.50"
    end   = "10.42.69.200"
  }

  assign_ipv4 {
    zerotier = true
  }

  assign_ipv6 {
    zerotier = true
    sixplane = false
    rfc4193  = false
  }

  route {
    target = "10.42.69.0/24"
  }

  enable_broadcast = true

  flow_rules = "accept;\n"
}

resource "zerotier_member" "bouncer" {
  name                    = "bouncer"
  member_id               = "7073a73e3a" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.1"]
}

resource "zerotier_member" "synapse" {
  name                    = "synapse"
  member_id               = "d4bf770df0" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.2"]
}

resource "zerotier_member" "warden1" {
  name                    = "warden1"
  member_id               = "29b5239cbb" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.20"]
}

resource "zerotier_member" "woods" {
  name                    = "woods"
  member_id               = "bd0e42bcda" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.100"]
}
