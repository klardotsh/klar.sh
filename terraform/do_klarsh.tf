resource "digitalocean_ssh_key" "default" {
  name       = "klardotsh SSH key 10 Apr 2018"
  public_key = file("../resources/id_rsa.pub")
}

resource "digitalocean_domain" "klarsh" {
  name = "klar.sh"
}

resource "digitalocean_record" "bouncer" {
  domain = digitalocean_domain.klarsh.name
  name   = "bouncer"
  type   = "A"
  ttl    = 3600
  value  = linode_instance.bouncer.ip_address
}

resource "digitalocean_record" "synapse" {
  domain = digitalocean_domain.klarsh.name
  name   = "synapse.srv"
  type   = "A"
  ttl    = 3600
  value  = linode_instance.synapse.ip_address
}

// create a wherever.srv.klar.sh record for all external servers
resource "digitalocean_record" "srv_external" {
  for_each = local.external_server_ips

  domain = digitalocean_domain.klarsh.name
  name   = "${each.key}.srv"
  type   = "A"
  ttl    = 3600
  value  = each.value
}

// backwards-compat dupe of home.srv.klar.sh
// this could probably become a CNAME but honestly I don't feel like finding
// out the hard way what breaks when I do this
resource "digitalocean_record" "home" {
  domain = digitalocean_domain.klarsh.name
  name   = "home"
  type   = "A"
  ttl    = 3600
  value  = local.external_server_ips.home
}

// work around https://github.com/matrix-org/matrix-federation-tester/issues/93, basically, but realistically klar.sh root going to home is fine
resource "digitalocean_record" "root" {
  domain = digitalocean_domain.klarsh.name
  name   = "@"
  type   = "A"
  ttl    = 3600
  value  = linode_instance.bouncer.ip_address
}

resource "digitalocean_record" "minecraft" {
  domain = digitalocean_domain.klarsh.name
  name   = "minecraft"
  type   = "CNAME"
  ttl    = 3600
  value  = "${digitalocean_record.srv_external["home"].fqdn}."
}

resource "digitalocean_record" "git" {
  domain = digitalocean_domain.klarsh.name
  name   = "git"
  type   = "CNAME"
  ttl    = 3600
  value = "@"
}

resource "digitalocean_record" "ci" {
  domain = digitalocean_domain.klarsh.name
  name   = "ci"
  type   = "CNAME"
  ttl    = 3600
  value = "@"
}

resource "digitalocean_record" "moveinscript" {
  domain = digitalocean_domain.klarsh.name
  name   = "moveinscript"
  type   = "CNAME"
  ttl    = 3600
  value = "@"
}

resource "digitalocean_record" "matrix" {
  domain = digitalocean_domain.klarsh.name
  name   = "matrix"
  type   = "CNAME"
  ttl    = 3600
  value = "@"
}

resource "digitalocean_record" "keybase_verification" {
  domain = digitalocean_domain.klarsh.name
  name   = "_keybase"
  type   = "TXT"
  ttl    = 3600
  value  = "keybase-site-verification=ESeSq9i-t9ile_3UDtaB2DuG-tpShro9gsWKhTab0LU"
}

resource "digitalocean_record" "klarsh_mail_in1" {
  domain   = digitalocean_domain.klarsh.name
  name     = "@"
  type     = "MX"
  ttl      = 14400
  priority = 10
  value    = "in1-smtp.messagingengine.com."
}

resource "digitalocean_record" "klarsh_mail_in2" {
  domain   = digitalocean_domain.klarsh.name
  name     = "@"
  type     = "MX"
  ttl      = 14400
  priority = 20
  value    = "in2-smtp.messagingengine.com."
}

resource "digitalocean_record" "klarsh_mail_txt" {
  domain = digitalocean_domain.klarsh.name
  name   = "@"
  type   = "TXT"
  ttl    = 3600
  value  = "v=spf1 include:spf.messagingengine.com ?all"
}

resource "digitalocean_record" "klarsh_mail_fm1" {
  domain = digitalocean_domain.klarsh.name
  name   = "fm1._domainkey"
  type   = "CNAME"
  ttl    = 43200
  value  = "fm1.klar.sh.dkim.fmhosted.com."
}

resource "digitalocean_record" "klarsh_mail_fm2" {
  domain = digitalocean_domain.klarsh.name
  name   = "fm2._domainkey"
  type   = "CNAME"
  ttl    = 43200
  value  = "fm2.klar.sh.dkim.fmhosted.com."
}

resource "digitalocean_record" "klarsh_mail_fm3" {
  domain = digitalocean_domain.klarsh.name
  name   = "fm3._domainkey"
  type   = "CNAME"
  ttl    = 43200
  value  = "fm3.klar.sh.dkim.fmhosted.com."
}
