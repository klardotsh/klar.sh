# Various Useful Snippets

This is an unordered mess of various snippets I find useful. These often live
in my shell history, retrieved and tweaked to taste with `Ctrl-R`. I share them
here in hopes they're useful to you, too, or also so that I can retrieve them
when my shell history inevitably gets wiped every so often.

### Create a rootless Distrobox container that grants access to any /dev entries the host user has access to

This assumes the use of `podman` v3.2+ (4.5 is current at time of writing) and
that `crun` is installed. The usecase here is for ensuring USB devices, for
example webcams, act the same in the container as they would on the host. I ran
into this while trying to figure out why Discord and Zoom couldn't see my
webcam in their respective containers.

```sh
distrobox create \
    -n discord \
    --image docker.io/archlinux:latest \
    -p --yes \
    --additional-flags "--runtime /usr/bin/crun --group-add keep-groups" \
    --home ~/.distrobox/discord
```

#### Related Reading

- ["Using files and devices in Podman rootless
  containers"](https://www.redhat.com/sysadmin/files-devices-podman), RedHat
  Sysadmin Blog, ret. 2023-11-21

