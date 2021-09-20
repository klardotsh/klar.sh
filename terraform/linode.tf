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

  linodes = [linode_instance.bouncer.id]
}
