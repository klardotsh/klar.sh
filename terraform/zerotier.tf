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

resource "zerotier_member" "anf-containers" {
  name                    = "anf-containers"
  member_id               = "97dc99b23c" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.21"]
}

resource "zerotier_member" "anf-factorio" {
  name                    = "anf-factorio"
  member_id               = "779025b67c" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.22"]
}

resource "zerotier_member" "woods" {
  name                    = "woods"
  member_id               = "bd0e42bcda" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.100"]
}

resource "zerotier_member" "snowcone_musl" {
  name                    = "snowcone"
  description             = "ITX Desktop - void-musl"
  member_id               = "442318aa78" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.60"]
}

resource "zerotier_member" "snowcone_glibc" {
  name                    = "snowcone"
  description             = "ITX Desktop - void-glibc"
  member_id               = "5cf4ea36c9" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.60"]
}

resource "zerotier_member" "nocturnes" {
  name                    = "nocturnes"
  description             = "Thinkpad X13 - void-musl"
  member_id               = "4407b5d2a9" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.70"]
}

resource "zerotier_member" "vermillion" {
  name                    = "vermillion"
  description             = "Samsung Chromebook Pro 2017 - void-musl"
  member_id               = "82db7b1fe0" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.92"]
}

resource "zerotier_member" "ftc_roadcase_mvp" {
  name                    = "ftc_roadcase_mvp"
  description             = "FIRST Tech Challenge Cube - 2023-24 MVP - Ubuntu"
  member_id               = "ccc12f3353" # generated after init sequence documented in linode.tf
  network_id              = zerotier_network.klardotsh.id
  allow_ethernet_bridging = true
  no_auto_assign_ips      = true
  ip_assignments          = ["10.42.69.30"]
}

import {
  to = zerotier_member.snowcone_musl
  id = "3efa5cb78a1df42a-442318aa78"
}

import {
  to = zerotier_member.snowcone_glibc
  id = "3efa5cb78a1df42a-5cf4ea36c9"
}

import {
  to = zerotier_member.nocturnes
  id = "3efa5cb78a1df42a-4407b5d2a9"
}

import {
  to = zerotier_member.vermillion
  id = "3efa5cb78a1df42a-82db7b1fe0"
}

import {
  to = zerotier_member.ftc_roadcase_mvp
  id = "3efa5cb78a1df42a-ccc12f3353"
}
