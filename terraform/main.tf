terraform {
  // set up s3 backend per https://www.terraform.io/docs/backends/types/s3.html
  // don't want tfstate on a single point of failure

  required_providers {
    gandi = {
      version = "2.3"
      source  = "go-gandi/gandi"
    }

    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.11"
    }

    linode = {
      source  = "linode/linode"
      version = "1.21"
    }

    zerotier = {
      source  = "zerotier/zerotier"
      version = "1.6"
    }
  }
}

provider "digitalocean" {}

variable "public_ip" {
  type = string
}

locals {
  external_server_ips = {
    dandelion = "54.36.105.50"
  }
}

