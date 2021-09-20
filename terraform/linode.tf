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

apk add --update zerotier-one
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
