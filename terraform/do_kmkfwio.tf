resource "digitalocean_spaces_bucket" "kmkreleases" {
  name   = "kmk-releases"
  region = "sfo2"
  acl    = "public-read"
}

resource "digitalocean_cdn" "kmkreleasescdn" {
  origin           = digitalocean_spaces_bucket.kmkreleases.bucket_domain_name
  custom_domain    = "cdn.${digitalocean_domain.kmkfwio.name}"
  certificate_name = digitalocean_certificate.kmkcdn.name
}

resource "digitalocean_certificate" "kmkcdn" {
  name = "KMK-CDN"
  type = "lets_encrypt"
  domains = [
    digitalocean_domain.kmkfwio.name,
    "cdn.${digitalocean_domain.kmkfwio.name}",
  ]
}

resource "digitalocean_domain" "kmkfwio" {
  name = "kmkfw.io"
}

resource "digitalocean_record" "kmkfw_github_io_1" {
  domain = digitalocean_domain.kmkfwio.name
  type   = "A"
  name   = "@"
  value  = "185.199.108.153"
}

resource "digitalocean_record" "kmkfw_github_io_2" {
  domain = digitalocean_domain.kmkfwio.name
  type   = "A"
  name   = "@"
  value  = "185.199.109.153"
}

resource "digitalocean_record" "kmkfw_github_io_3" {
  domain = digitalocean_domain.kmkfwio.name
  type   = "A"
  name   = "@"
  value  = "185.199.110.153"
}

resource "digitalocean_record" "kmkfw_github_io_4" {
  domain = digitalocean_domain.kmkfwio.name
  type   = "A"
  name   = "@"
  value  = "185.199.111.153"
}

resource "digitalocean_record" "kmkfw_github_io_www" {
  domain = digitalocean_domain.kmkfwio.name
  type   = "CNAME"
  name   = "www"
  value  = "kmkfw.github.io."
}

resource "digitalocean_record" "kmkfwions1" {
  domain = digitalocean_domain.kmkfwio.name
  type   = "NS"
  name   = "@"
  value  = "ns1.digitalocean.com."
}

resource "digitalocean_record" "kmkfwions2" {
  domain = digitalocean_domain.kmkfwio.name
  type   = "NS"
  name   = "@"
  value  = "ns2.digitalocean.com."
}

resource "digitalocean_record" "kmkfwions3" {
  domain = digitalocean_domain.kmkfwio.name
  type   = "NS"
  name   = "@"
  value  = "ns3.digitalocean.com."
}
