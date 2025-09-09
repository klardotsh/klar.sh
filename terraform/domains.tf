/* All of these should come from env vars for privacy. */
variable "whois_email" {
  type = string
}

variable "whois_given_name" {
  type = string
}

variable "whois_family_name" {
  type = string
}

variable "whois_phone" {
  type = string
}

variable "whois_city" {
  type = string
}

variable "whois_country" {
  type    = string
  default = "US"
}

variable "whois_state" {
  type = string
}

variable "whois_street_addr" {
  type = string
}

variable "whois_zip" {
  type = string
}

variable "whois_type" {
  type    = string
  default = "person"
}
/* End env vars. */

locals {
  ns_digitalocean = [
    "ns1.digitalocean.com",
    "ns2.digitalocean.com",
    "ns3.digitalocean.com",
  ]
}

# Note that Gandi provider doesn't currently support updating domain owner
# contact as of time of writing, so we must `ignore_changes` the entire owner
# block for now.

resource "gandi_domain" "absolutelynot_fun" {
  name = "absolutelynot.fun"

  owner {
    city        = var.whois_city
    country     = var.whois_country
    email       = var.whois_email
    family_name = var.whois_family_name
    given_name  = var.whois_given_name
    phone       = var.whois_phone
    state       = var.whois_state
    street_addr = var.whois_street_addr
    type        = var.whois_type
    zip         = var.whois_zip
  }

  lifecycle {
    ignore_changes = [owner]
  }
}

import {
  to = gandi_domain.absolutelynot_fun
  id = "absolutelynot.fun"
}

resource "gandi_livedns_domain" "absolutelynot_fun" {
  name = "absolutelynot.fun"
}

import {
  to = gandi_livedns_domain.absolutelynot_fun
  id = "absolutelynot.fun"
}

resource "gandi_livedns_record" "writing_is_anf" {
  name   = "writing.is"
  zone   = gandi_livedns_domain.absolutelynot_fun.name
  ttl    = 360
  type   = "CNAME"
  values = ["${digitalocean_record.bouncer.fqdn}."]
}

resource "gandi_livedns_record" "bookmarks_are_anf" {
  name   = "bookmarks.are"
  zone   = gandi_livedns_domain.absolutelynot_fun.name
  ttl    = 360
  type   = "CNAME"
  values = ["${digitalocean_record.bouncer.fqdn}."]
}

resource "gandi_livedns_record" "factorio_is_anf" {
  name   = "factorio.is"
  zone   = gandi_livedns_domain.absolutelynot_fun.name
  ttl    = 360
  type   = "A"
  values = [linode_instance.anf_factorio.ip_address]
}

resource "gandi_domain" "whattheref_info" {
  name = "whattheref.info"
  # nameservers = local.ns_digitalocean
  # ^ evidently uses Gandi LiveDNS for now still

  owner {
    city        = var.whois_city
    country     = var.whois_country
    email       = var.whois_email
    family_name = var.whois_family_name
    given_name  = var.whois_given_name
    phone       = var.whois_phone
    state       = var.whois_state
    street_addr = var.whois_street_addr
    type        = var.whois_type
    zip         = var.whois_zip
  }

  lifecycle {
    ignore_changes = [owner]
  }
}

import {
  to = gandi_domain.whattheref_info
  id = "whattheref.info"
}

resource "gandi_domain" "stopfuckingbreakingshit_online" {
  name = "stopfuckingbreakingshit.online"

  owner {
    city        = var.whois_city
    country     = var.whois_country
    email       = var.whois_email
    family_name = var.whois_family_name
    given_name  = var.whois_given_name
    phone       = var.whois_phone
    state       = var.whois_state
    street_addr = var.whois_street_addr
    type        = var.whois_type
    zip         = var.whois_zip
  }

  lifecycle {
    ignore_changes = [owner]
  }
}

import {
  to = gandi_domain.stopfuckingbreakingshit_online
  id = "stopfuckingbreakingshit.online"
}

resource "gandi_domain" "iv597_com" {
  name        = "iv597.com"
  nameservers = local.ns_digitalocean

  owner {
    city        = var.whois_city
    country     = var.whois_country
    email       = var.whois_email
    family_name = var.whois_family_name
    given_name  = var.whois_given_name
    phone       = var.whois_phone
    state       = var.whois_state
    street_addr = var.whois_street_addr
    type        = var.whois_type
    zip         = var.whois_zip
  }

  lifecycle {
    ignore_changes = [owner]
  }
}

import {
  to = gandi_domain.iv597_com
  id = "iv597.com"
}

resource "gandi_domain" "klar_sh" {
  name        = "klar.sh"
  nameservers = local.ns_digitalocean

  owner {
    city        = var.whois_city
    country     = var.whois_country
    email       = var.whois_email
    family_name = var.whois_family_name
    given_name  = var.whois_given_name
    phone       = var.whois_phone
    state       = var.whois_state
    street_addr = var.whois_street_addr
    type        = var.whois_type
    zip         = var.whois_zip
  }

  lifecycle {
    ignore_changes = [owner]
  }
}

import {
  to = gandi_domain.klar_sh
  id = "klar.sh"
}

resource "gandi_domain" "joshklar_com" {
  name        = "joshklar.com"
  nameservers = local.ns_digitalocean

  owner {
    city        = var.whois_city
    country     = var.whois_country
    email       = var.whois_email
    family_name = var.whois_family_name
    given_name  = var.whois_given_name
    phone       = var.whois_phone
    state       = var.whois_state
    street_addr = var.whois_street_addr
    type        = var.whois_type
    zip         = var.whois_zip
  }

  lifecycle {
    ignore_changes = [owner]
  }
}

import {
  to = gandi_domain.joshklar_com
  id = "joshklar.com"
}
