# Converting a Void Linux install from Musl to glibC in place

> Or: Despite their complexities, ZFS+ZFSBootMenu enable some cool things
> sometimes.
>
> When: _September 19, 2024_
>
> Where: _Northern Kitsap Peninsula, Washington, USA_

Yesterday, I got pissed off at Mozilla's continuing declarations of contempt of
their userbase (the most recent sins being [implementing adtech-enabling
functionality and calling it "privacy
preserving"](//support.mozilla.org/en-US/kb/privacy-preserving-attribution) and
[pushing AI-hypetrain bullshit into the browser
sidebar](//www.mozilla.org/en-US/firefox/130.0/releasenotes/)) and decided it
was long past time I gave [QuteBrowser](//qutebrowser.org) another go. I hate
the idea of ceding the browser engine wars to Blink [^1], but I hate
user-hostile software more, and QuteBrowser, while quirky and sometimes
limited, is at least an excellently user-respecting and hackable shell over
Blink-via-QTWebEngine.

[^1]: Mozilla is the last independent contender with a decent swath of the web
    standards covered; we'll see if [Ladybird](//ladybird.org) takes off or if
    [Netsurf](//netsurf-browser.org) ever regains much of a developer pool.

Here's the problem: [Void Linux has been shipping broken V8-based stuff on Musl
for ages](//github.com/void-linux/void-packages/issues/29654). Yes, I'm one of
those dozen or so crazy people who daily-drive Musl on desktop workstations
- or did for a good few years, until yesterday [^2]. Well, it was a good run,
Musl, maybe I'll see you on workstations again in an Alpine or Gentoo
context, or on some mythical future distribution I build myself where Musl
and glibC can co-exist on the same system. For now, let's convert over to the
GNU dark side again so I can change my browser out. I'm documenting this
process in part in case I ever need to come back to it again some day, and in
part because there seems to be scarce documentation on doing this aside from
[a Reddit post that details a slightly different and older
method](https://www.reddit.com/r/voidlinux/comments/grm7ao/comment/frzwxmo/).

[^2]: I mostly worked around proprietary apps and so forth using Podman
    containers, most recently via my [Box On
    Wheels](//git.sr.ht/~klardotsh/box-on-wheels) collection. This arrangement
    was surprisingly quite pleasant, albeit occasionally buggy - eg. Apico
    refused to find the central matchmaking servers while living in Steam's
    container's network namespace.

Note that this method assumes you are using a ZFS root partition and
[ZFSBootMenu](//zfsbootmenu.org/), which allows doing this operation without
ever booting to live/recovery media. Filesystems with the concept of
"datasets", like BtrFS, should likely enable a similar workflow. On more
conventional filesystems without "datasets", something like the aforementioned
Reddit post's method may work better, but perhaps some of this document will be
useful to you anyway.

It also assumes your home directory is a separate dataset from the root, which
is a great idea on filesystems with datasets anyway. On traditional
filesystems, I find it harder to recommend, because knowing how to size `/` vs
`/home` is more luck than art or science on workstations.

I did this all as a user, so you'll see
[`doas`](//wiki.archlinux.org/title/Doas) littered all over. You could also
just do all of this as `root` and be done with it.

```sh
# First, let's create a new rootfs dataset, assuming that our rootfs pool is
# called `zroot`. Remember that canmount=noauto is required to avoid / mountpoint
# collisions in a ZFSBootMenu world, but we're temporarily setting an
# alternative mountpoint which we'll later revert to /.
doas zfs create -o mountpoint=/glibcroot -o canmount=noauto zroot/ROOT/void-glibc
doas zfs mount zroot/ROOT/void-glibc
doas mkdir -p /glibcroot/boot/efi

# Make sure our system is fully up to date before we try doing anything.
doas xbps-install -Su

# Now take stock of all explicitly-installed packages on the system.
xbps-query -m | doas tee /glibcroot/restorepkgs.txt

# Restore that package set on the glibC side of the world, grepping out
# anything that doesn't exist. This might include packages that aren't packaged
# for the other libC, or packages that you built in your own copy of the
# void-packages ports tree, or packages that have been removed from the
# upstream repos after you installed them (for example, `zerotier-one`). I did
# this with no greps and then kept adding exclusions until xbps stopped
# complaining.
#
# Note that many configure steps will fail, and that's fine: we'll fix them in
# a chroot later.
doas env XBPS_ARCH=x86_64 xbps-install -S \
    -R https://repo-fastly.voidlinux.org/current \
    -r /glibcroot \
    $(grep -v 'distrobox|doggo|waynergy|zerotier-one' /glibcroot/restorepkgs.txt | xargs)

# Now enable whatever locales you need. If you haven't used glibC in a while,
# this might be a blast from the past :)
doas nvim /glibcroot/etc/default/libc-locales
doas nvim /glibcroot/etc/locale.conf

# Restore users, groups, timezone, custom initramfs shenanigans, kernel module
# configs, etc. It's not the safest way ever to do this, but I ran into no
# critical failures handling this the brute-force way like this.
#
# The subuid/subgid stuff was necessary to preserve for Podman to work on the
# resulting system with existing containers/images/etc. I forgot to do this in
# the initial pass, so I'm retconning this line to include it :)
#
# And yes, I'm using rsync to lazily guarantee subdirectories Just Work whether
# they exist on the target or not. I'm not here to play coreutils purity games,
# I'm here to get shit rebuilt and go touch some grass, or go to bed.
doas rsync -avh /etc/{hostname,modprobe.d,modules-load.d,machine-id,group*,*shadow*,doas.conf,fstab,dracut*,host.conf,libao.conf,localtime,passwd*,zfs,iwd,subuid*,subgid*} /glibcroot/etc/

# Alright, now go fix the world insofar as whatever was broken when we did the
# giant xbps-install earlier.
doas xchroot /glibcroot xbps-reconfigure -fa

# Now, jot down which services you have enabled so that you can re-enable them
# in the new system after a reboot (we can't do this without being booted into
# the environment because of how /var/service is mounted).
ls -l /var/service | doas tee /glibcroot/restoreservices.txt

# Now unmount the new root and set it to mount to /, and toggle our primary
# boot fs with ZFSBootMenu.
doas zfs unmount zroot/ROOT/void-glibc
doas zfs set mountpoint=/ zroot/ROOT/void-glibc
doas zpool set bootfs=zroot/ROOT/void-glibc zroot

# Reboot into the new system!
doas reboot

# Okay, welcome back, assuming that didn't fail in some mysterious way (it
# didn't here, at least not after fixing things I retconned back into the above
# notes).
#
# Now, manually re-enable the services from /restoreservices.txt using
# `sv-enable` from `sv-helpers` or just `ln -s` as per the Void Handbook.
doas sv-enable dbus
doas sv-enable seatd
doas sv-enable bluetoothd
# ... etc

# One more reboot!
doas reboot
```

At this point you should mostly be good to go and should be in a system that is
more or less identical to the one we left, except on a different libC! You'll
want to purge any binaries you built outside of package manager control and
rebuild them - for example `~/.go/bin`, `~/.cargo/bin`, stuff built with
Nimble, etc. If you use Tridactyl for Firefox, the Native Messenger will also
need replaced with one compatible with the libC you moved to [until this
upstream issue is resolved](//github.com/tridactyl/native_messenger/issues/50).

I think that's all I've got to document for you tonight, pals. Cheers! If you
have questions, concerns, feedback, etc., email me via the details [on my
contact page](/contact).
