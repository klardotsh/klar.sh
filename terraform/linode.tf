data "linode_profile" "me" {}

resource "linode_sshkey" "klardotsh" {
  label   = "klardotsh SSH key 10 Apr 2018"
  ssh_key = chomp(file("../resources/id_rsa.pub"))
}

resource "linode_instance" "bouncer" {
  label            = "bouncer"
  region           = "us-west"
  type             = "g6-nanode-1"
  authorized_users = [data.linode_profile.me.username]
  image            = "linode/alpine3.14"
}

/*
How this box was set up:

ssh root@bouncer.klar.sh
echo bouncer > /etc/hostname
hostname -F /etc/hostname

# needed because apk add will hang otherwise. can we finally stop trying to
# make ipv6 happen? the answer is almost always "disable it if you want
# anything to work"
#
# quasi-related: https://github.com/gliderlabs/docker-alpine/issues/307
sysctl net.ipv6.conf.all.disable_ipv6=1
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf

apk add --update zerotier-one
rc-update add zerotier-one default
rc-service zerotier-one start
zerotier-cli info # copy out the ID here for zerotier.tf
zerotier-cli join <network id from zerotier.tf output>
reboot # because alpine by default doesn't have /dev hotplugging (I guess? busybox, eh?)

# replace ztrfyecq5a with the correct entry from `ip link`
vi /etc/network/interfaces.d/zerotier
# auto ztrfyecq5a
# iface ztrfyecq5a inet dhcp
#     hostname bouncer

# I'm lazy. may or may not have actually been required as I was also fighting
# ZT battles at this point
reboot

apk add --update caddy

# for now I don't have a great config management system (be it oof, ansible, or
# whatever), so copy over the Caddyfile from this repo's root to
# /etc/caddy/Caddyfile
 */

resource "linode_firewall" "bouncer_firewall" {
  label           = "bouncer"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  inbound {
    label    = "allow-ssh-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-ssh-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-http-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-http-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-https-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-https-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-zt-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "9993"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  linodes = [linode_instance.bouncer.id]
}

resource "linode_instance" "synapse" {
  label            = "synapse"
  region           = "us-west"
  type             = "g6-nanode-1"
  authorized_users = [data.linode_profile.me.username]
  image            = "linode/alpine3.14"
  backups_enabled  = true
}

/*
How this box was set up:

ssh root@synapse.srv.klar.sh
echo synapse > /etc/hostname
hostname -F /etc/hostname

# needed because apk add will hang otherwise. can we finally stop trying to
# make ipv6 happen? the answer is almost always "disable it if you want
# anything to work"
#
# quasi-related: https://github.com/gliderlabs/docker-alpine/issues/307
sysctl net.ipv6.conf.all.disable_ipv6=1
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf

apk add --update foot-extra-terminfo zerotier-one
rc-update add zerotier-one default
rc-service zerotier-one start
zerotier-cli info # copy out the ID here for zerotier.tf
zerotier-cli join <network id from zerotier.tf output>
reboot # because alpine by default doesn't have /dev hotplugging (I guess? busybox, eh?)

apk add --update synapse

# for now I don't have a great config management system (be it oof, ansible, or
# whatever), so copy over the homeserver.yaml from this repo's root to
# /etc/synapse/homeserver.yaml. I also copied media, uploads, and OLM signing
# keys over to /var/lib/synapse, since that isn't on a shared volume yet

rc-update add synapse default
rc-service synapse start
 */

resource "linode_firewall" "synapse_firewall" {
  label           = "synapse"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  inbound {
    label    = "allow-ssh-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-ssh-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-zt-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "9993"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }


  linodes = [linode_instance.synapse.id]
}

resource "linode_instance" "warden" {
  label            = "warden"
  region           = "us-west"
  type             = "g6-nanode-1"
  authorized_users = [data.linode_profile.me.username]
  image            = "linode/alpine3.19"
  backups_enabled  = true
}

/*
How this box was set up:

ssh root@warden1.srv.klar.sh
echo warden1 > /etc/hostname
hostname -F /etc/hostname

# needed because apk add will hang otherwise. can we finally stop trying to
# make ipv6 happen? the answer is almost always "disable it if you want
# anything to work"
#
# quasi-related: https://github.com/gliderlabs/docker-alpine/issues/307
sysctl net.ipv6.conf.all.disable_ipv6=1
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf

# Vaultwarden isn't stabilized yet
echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories
# Re-add zerotier support (TODO: remove...)
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.17/community' >> /etc/apk/repositories

apk add --update foot-extra-terminfo zerotier-one vaultwarden vaultwarden-web-vault
rc-update add zerotier-one default
rc-service zerotier-one start
zerotier-cli info # copy out the ID here for zerotier.tf
zerotier-cli join <network id from zerotier.tf output>
reboot # because alpine by default doesn't have /dev hotplugging (I guess? busybox, eh?)

rc-update add vaultwarden default

# for now I don't have a great config management system (be it oof, ansible, or
# whatever), so edit /etc/conf.d/vaultwarden and ensure DOMAIN=https://warden.klar.sh,
# SIGNUPS_ALLOWED=false, SIGNUPS_DOMAINS_WHITELIST=klar.sh, SIGNUPS_VERIFY=true, and
# configure SMTP_* appropriately. ROCKET_ADDRESS=<assigned zerotier address>,
# ADMIN_TOKEN as generated by `vaultwarden hash`. WEB_VAULT_ENABLED=true
#
# SMTP_PASSWORD needs generated at
# https://app.fastmail.com/settings/security/integrations for the automation@
# account

rc-service vaultwarden start
 */

resource "linode_firewall" "warden_firewall" {
  label           = "warden"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  inbound {
    label    = "allow-ssh-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-ssh-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-zt-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "9993"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }


  linodes = [linode_instance.warden.id]
}

resource "linode_instance" "anf_containers" {
  label            = "anf_containers"
  region           = "us-west"
  type             = "g6-nanode-1"
  authorized_users = [data.linode_profile.me.username]
  image            = "linode/alpine3.19"
  backups_enabled  = true
}

/*
How this box was set up:

ssh root@containing.absolutelynot.fun
echo containing > /etc/hostname
hostname -F /etc/hostname

# needed because apk add will hang otherwise. can we finally stop trying to
# make ipv6 happen? the answer is almost always "disable it if you want
# anything to work"
#
# quasi-related: https://github.com/gliderlabs/docker-alpine/issues/307
sysctl net.ipv6.conf.all.disable_ipv6=1
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf

# Re-add zerotier support (TODO: remove...)
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.17/community' >> /etc/apk/repositories

apk add --update foot-extra-terminfo zerotier-one docker docker-compose
apk upgrade
rc-update add zerotier-one default
rc-update add docker default
rc-service zerotier-one start
zerotier-cli info # copy out the ID here for zerotier.tf
zerotier-cli join <network id from zerotier.tf output>
reboot # because alpine by default doesn't have /dev hotplugging (I guess? busybox, eh?)

# add docker services as necessary...
 */

resource "linode_firewall" "anf_containers_firewall" {
  label           = "anf_containers"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  inbound {
    label    = "allow-ssh-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-ssh-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-zt-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "9993"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }


  linodes = [linode_instance.anf_containers.id]
}

resource "linode_instance" "anf_factorio" {
  label            = "anf_factorio"
  region           = "us-west"
  type             = "g6-standard-2"
  authorized_users = [data.linode_profile.me.username]
  image            = "linode/alpine3.20"
  backups_enabled  = true
}

/*
How this box was set up:

ssh root@factorio.is.absolutelynot.fun
echo factorio-anf > /etc/hostname
hostname -F /etc/hostname

# needed because apk add will hang otherwise. can we finally stop trying to
# make ipv6 happen? the answer is almost always "disable it if you want
# anything to work"
#
# quasi-related: https://github.com/gliderlabs/docker-alpine/issues/307
sysctl net.ipv6.conf.all.disable_ipv6=1
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf

# Re-add zerotier support (TODO: remove...)
echo 'http://dl-cdn.alpinelinux.org/alpine/v3.17/community' >> /etc/apk/repositories

apk add --update foot-extra-terminfo zerotier-one docker docker-compose
apk upgrade
rc-update add zerotier-one default
rc-update add docker default
rc-service zerotier-one start
zerotier-cli info # copy out the ID here for zerotier.tf
zerotier-cli join <network id from zerotier.tf output>
reboot # because alpine by default doesn't have /dev hotplugging (I guess? busybox, eh?)

# then, per https://github.com/factoriotools/factorio-docker readme (change
# SAVE_NAME as appropriate)
docker run -d \
	-p 34197:34197/udp \
	-p 27015:27015/tcp \
	-v /srv/factorio:/factorio \
	-e LOAD_LATEST_SAVE=false \
	-e SAVE_NAME="klardotsh learns space age" \
	--name factorio \
	--restart=unless-stopped \
	factoriotools/factorio:stable
 */
resource "linode_firewall" "anf_factorio_firewall" {
  label           = "anf_factorio"
  inbound_policy  = "DROP"
  outbound_policy = "ACCEPT"

  inbound {
    label    = "allow-ssh-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-ssh-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "22"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-zt-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "9993"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-factorio-udp"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "34197"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-factorio-tcp"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "27015"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  linodes = [linode_instance.anf_factorio.id]
}

