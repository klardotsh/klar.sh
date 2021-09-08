terraform {
  // set up s3 backend per https://www.terraform.io/docs/backends/types/s3.html
  // don't want tfstate on a single point of failure

  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.11"
    }

    vultr = {
      source = "vultr/vultr"
      version = "1.5"
    }
  }
}

provider "digitalocean" {}

provider "vultr" {}

data "vultr_region" "amsterdam" {
  filter {
    name   = "name"
    values = ["Amsterdam"]
  }
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

