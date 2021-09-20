resource "zerotier_network" "klardotsh" {
  name = "klardotsh"

  assignment_pool {
    start = "10.42.69.2"
    end   = "10.42.69.253"
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

  flow_rules = "accept;"
}

resource "zerotier_member" "bouncer" {
  name                    = "bouncer"
  member_id               = "7073a73e3a" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.1"]
}
