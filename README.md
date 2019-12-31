# klardotsh's infrastructure

This repository is a monorepo containing basically everything that publicly
exists at my domain `klar.sh`, including Terraform-driven DNS records, and
`docker-compose`-based service definitions.

A simple Makefile is included which (assuming an envfile has previously been
sourced) spins up all the Docker services and ensures Gandi agrees with the
state of DNS. By side effect, it also serves as a bit of a dynamic DNS solution,
as it requests my server's WAN address at the `apply` stage.

This repo is released under the [Creative Commons Zero 1.0
Universal](https://creativecommons.org/publicdomain/zero/1.0/) license, as close
to public domain as is legally possible worldwide.
