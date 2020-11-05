terraform {
  // set up s3 backend per https://www.terraform.io/docs/backends/types/s3.html
  // don't want tfstate on a single point of failure
}

provider "digitalocean" {
  version = "~> 2.0.2"
}

variable "public_ip" {
  type = string
}

locals {
  external_server_ips = {
    dandelion = "54.36.105.50"
    home      = var.public_ip
  }
}

