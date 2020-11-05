resource "digitalocean_domain" "joshklar" {
  name = "joshklar.com"
}

resource "digitalocean_record" "joshklar_mail_in1" {
  domain   = digitalocean_domain.joshklar.name
  name     = "@"
  type     = "MX"
  ttl      = 14400
  priority = 10
  value    = "in1-smtp.messagingengine.com."
}

resource "digitalocean_record" "joshklar_mail_in2" {
  domain   = digitalocean_domain.joshklar.name
  name     = "@"
  type     = "MX"
  ttl      = 14400
  priority = 20
  value    = "in2-smtp.messagingengine.com."
}

resource "digitalocean_record" "joshklar_mail_txt" {
  domain = digitalocean_domain.joshklar.name
  name   = "@"
  type   = "TXT"
  ttl    = 3600
  value  = "v=spf1 include:spf.messagingengine.com ?all"
}

resource "digitalocean_record" "joshklar_mail_fm1" {
  domain = digitalocean_domain.joshklar.name
  name   = "fm1._domainkey"
  type   = "CNAME"
  ttl    = 43200
  value  = "fm1.joshklar.com.dkim.fmhosted.com."
}

resource "digitalocean_record" "joshklar_mail_fm2" {
  domain = digitalocean_domain.joshklar.name
  name   = "fm2._domainkey"
  type   = "CNAME"
  ttl    = 43200
  value  = "fm2.joshklar.com.dkim.fmhosted.com."
}

resource "digitalocean_record" "joshklar_mail_fm3" {
  domain = digitalocean_domain.joshklar.name
  name   = "fm3._domainkey"
  type   = "CNAME"
  ttl    = 43200
  value  = "fm3.joshklar.com.dkim.fmhosted.com."
}
