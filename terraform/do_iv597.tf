resource "digitalocean_domain" "iv597" {
  name = "iv597.com"
}

resource "digitalocean_record" "iv597_mail_in1" {
  domain   = digitalocean_domain.iv597.name
  name     = "@"
  type     = "MX"
  ttl      = 14400
  priority = 10
  value    = "in1-smtp.messagingengine.com."
}

resource "digitalocean_record" "iv597_mail_in2" {
  domain   = digitalocean_domain.iv597.name
  name     = "@"
  type     = "MX"
  ttl      = 14400
  priority = 20
  value    = "in2-smtp.messagingengine.com."
}

resource "digitalocean_record" "iv597_mail_txt" {
  domain = digitalocean_domain.iv597.name
  name   = "@"
  type   = "TXT"
  ttl    = 3600
  value  = "v=spf1 include:spf.messagingengine.com ?all"
}

resource "digitalocean_record" "iv597_mail_fm1" {
  domain = digitalocean_domain.iv597.name
  name   = "fm1._domainkey"
  type   = "CNAME"
  ttl    = 43200
  value  = "fm1.iv597.com.dkim.fmhosted.com."
}

resource "digitalocean_record" "iv597_mail_fm2" {
  domain = digitalocean_domain.iv597.name
  name   = "fm2._domainkey"
  type   = "CNAME"
  ttl    = 43200
  value  = "fm2.iv597.com.dkim.fmhosted.com."
}

resource "digitalocean_record" "iv597_mail_fm3" {
  domain = digitalocean_domain.iv597.name
  name   = "fm3._domainkey"
  type   = "CNAME"
  ttl    = 43200
  value  = "fm3.iv597.com.dkim.fmhosted.com."
}
