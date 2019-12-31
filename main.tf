terraform {
	// set up s3 backend per https://www.terraform.io/docs/backends/types/s3.html
	// don't want tfstate on a single point of failure
}

variable "public_ip" {
	type = string
}

provider "gandi" {}

resource "gandi_zone" "klar_sh" {
	name = "klar.sh zone"
}

resource "gandi_zonerecord" "home" {
	zone = gandi_zone.klar_sh.id
	name = "home"
	type = "A"
	ttl = 3600
	values = [
		var.public_ip,
	]
}

resource "gandi_zonerecord" "minecraft" {
	zone = gandi_zone.klar_sh.id
	name = "minecraft"
	type = "CNAME"
	ttl = 3600
	values = [
		"home.klar.sh."
	]
}

resource "gandi_zonerecord" "git" {
	zone = gandi_zone.klar_sh.id
	name = "git"
	type = "CNAME"
	ttl = 3600
	values = [
		"home.klar.sh."
	]
}

resource "gandi_zonerecord" "matrix" {
	zone = gandi_zone.klar_sh.id
	name = "matrix"
	type = "A"
	ttl = 3600
	values = [
		"68.183.251.88"
	]
}

resource "gandi_zonerecord" "matrix_1" {
	zone = gandi_zone.klar_sh.id
	name = "1.matrix"
	type = "A"
	ttl = 3600
	values = [
		"104.248.219.201"
	]
}

resource "gandi_zonerecord" "matrix_srv" {
	zone = gandi_zone.klar_sh.id
	name = "_matrix._tcp"
	type = "SRV"
	ttl = 3600
	values = [
		"1 100 443 matrix.klar.sh."
	]
}

resource "gandi_zonerecord" "keybase_verification" {
	zone = gandi_zone.klar_sh.id
	name = "_keybase"
	type = "TXT"
	ttl = 3600
	values = [
		"keybase-site-verification=ESeSq9i-t9ile_3UDtaB2DuG-tpShro9gsWKhTab0LU"
	]
}

resource "gandi_zonerecord" "mail" {
	zone = gandi_zone.klar_sh.id
	name = "@"
	type = "MX"
	ttl = 14400
	values = [
		"10 in1-smtp.messagingengine.com.",
		"20 in2-smtp.messagingengine.com.",
	]
}

resource "gandi_zonerecord" "mail_txt" {
	zone = gandi_zone.klar_sh.id
	name = "@"
	type = "TXT"
	ttl = 3600
	values = [
		"v=spf1 include:spf.messagingengine.com ?all",
	]
}

resource "gandi_zonerecord" "mail_fm1" {
	zone = gandi_zone.klar_sh.id
	name = "fm1._domainkey"
	type = "CNAME"
	ttl = 43200
	values = [
		"fm1.klar.sh.dkim.fmhosted.com.",
	]
}

resource "gandi_zonerecord" "mail_fm2" {
	zone = gandi_zone.klar_sh.id
	name = "fm2._domainkey"
	type = "CNAME"
	ttl = 43200
	values = [
		"fm2.klar.sh.dkim.fmhosted.com.",
	]
}

resource "gandi_zonerecord" "mail_fm3" {
	zone = gandi_zone.klar_sh.id
	name = "fm3._domainkey"
	type = "CNAME"
	ttl = 43200
	values = [
		"fm3.klar.sh.dkim.fmhosted.com.",
	]
}

resource "gandi_domainattachment" "klar_sh" {
	domain = "klar.sh"
	zone = gandi_zone.klar_sh.id
}
