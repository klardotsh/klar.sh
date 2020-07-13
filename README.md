# klardotsh's infrastructure

> Yes, I'm aware that the URL of the canonical copy of this repo,
> `https://git.klar.sh/klardotsh/klar.sh`, is comically redundant...

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

> This repo currently depends on
> `terraform-provider-gandi@891e660c01d18cb458ccdef5ac02d192c61020a3`, and will
> not work with newer versions. Beyond that, the provider seems to have been
> removed from the Terraform plugins registry (at least under the name this repo
> expected), so building from source is currently the *only* option.
