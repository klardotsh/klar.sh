# Uses

This is a living document in the spirit of [uses.tech](https://uses.tech) and
[Uses This](https://usesthis.com) where you'll find a rough rundown of the
hardware and software that makes up my daily working stack, and (where
relevant), what my dream setup would be (in my current state of mind, at
least!). This doesn't yet include any notes about any boat hardware,
woodworking tools, etc., though I might add pages to this effect later.

> <span class="tangential">
> I'm *constantly* changing my setup and tinkering with things on a monthly or
> at least quarterly basis in some form or another. The history of this page is
> all [in version
> control](https://git.sr.ht/~klardotsh/klar.sh/log/master/item/www/src/now.md),
> that history may be useful or entertaining or both.
> </span>

Most recent update: `2024-02-13`

## Primary Desktop Setup

![A picture of this workstation in my home office](/workstation-2024-02-13.png)

> <span class="tangential">
> For those curious, the hostname is `snowcone`, after [the deadmau5
> song](https://songwhip.com/deadmau5/snowcone).
> </span>

- A custom desktop build optimized mostly for largely-parallelized development
  work and running RAM-intensive development tools, but also for light (eg.
  Factorio, Oxygen Not Included, Dorfromantik, etc.) gaming (even at the crazy
  resolution I push - see displays bullet point below).

    * AMD 7900 gently overclocked to about 5.6GHz
    * 96GB RAM (2x Crucial 48GB DDR5 5600MT/s sticks)
    * 2TB Samsung 990 Pro SSD
    * AMD 7600 GPU (8GB)
    * Cooling is handled by a huge array of BeQuiet products, including a Dark
      Rock Pro 5 CPU cooler (it's nearly silent, indeed)
    * Cased in a Thermaltake Tower 200

  This machine runs Void Linux x86\_64-glibc (for now) on a ZFS root.

  <details>
  <summary>My dream device in this category...</summary>
  I'm not even sure any more - I guess give me an ARM64 or RISC-V rig with
  32-128GB of RAM and a GPU capable of playing things no more intensive than
  Minecraft, and make it draw less than 30W at full tilt. Now make it run Linux
  and/or FreeBSD and/or OpenBSD well, and let it be powered off DC easily to
  avoid AC inversion costs in DC-native environments (although I currently no
  longer live in one, I intend to some day again in the future). At this point,
  the only currently-available devices that would fit the bill are probably the
  Qualcomm-based Windows Dev Kit 2023 ("Volterra"), which until very recently
  had nightmarish problems booting Linux, and a Mac Mini with a modded power
  supply (which still requires tons of work from the Asahi crew to be usable,
  so it's a bold bet). Or maybe something in the RK3588 family.
  </details>

- [2x LG DualUp](https://www.lg.com/us/monitors/lg-28mq750-c-dualup-monitor)
  Monitors with the LG Ergo Stands. Turned landscape and angled into somewhat
  of a "curved field of view", this setup functionally resembles the ultrawides
  I once used, but with a significantly better vertical aspect. The bezels in
  the middle of my field of view are annoying, but the upshot is that I now
  have two physical monitors, which can be window managed independently.
  Keeping chats and other distractions (or documentation, or whatever) on one
  monitor, and the primary task at hand (editors, games, whatever) on the other
  is an excellent workflow, and something I didn't really get to do during my
  6+ year stint with ultrawide monitors previously.

  These DualUps have more than exceeded expectations so far (so much so that
  after 6 months on a single one, I bought a second), and the near-square
  aspect ratio is <em>significantly</em> better than any widescreen aspect
  ratio for my uses.

  <details>
  <summary>My dream device in this category...</summary>
  I've been saying for years my ideal setup would probably be two e-ink
  displays of reasonable size, and an OLED display for watching video or
  otherwise colorized or high framerate content. I'm still interested in trying
  this, but every time I poke at Dasung and Boox's offerings in the standalone
  e-ink monitor space, they're just so horribly expensive that I can't justify
  the things, especially with enough physical screen space to be useful to me
  for dev work (2x 13" or one 21" or bigger panel). 

  Honestly though, for as long as I'm on the IPS/LCD screen train, I think I
  already have my dream setup. Thanks, LG, for thinking way outside the box!
  </details>

- For keyboard input, I primarily use a [Unicorne
  LP](https://www.boardsource.xyz/products/unicorne-LP) running a Dvorak-based
  layout you can find [in my QMK config
  repo](https://github.com/klardotsh/qmk_firmware/blob/klardotsh/main/layouts/community/split_3x6_3/klardotsh/keymap.c).
  This was a huge change after about 5 years running the same [Keebio Iris
  keyboard](https://keeb.io/collections/iris-split-ergonomic-keyboard) with my
  own [KMK firmware](https://github.com/KMKfw/kmk_firmware), but it was time
  for some lighter, shorter switches and a change of layout.

  I'm starting to dabble with even-smaller keyboards: I'm starting to put
  together a layout for an [Osprette MX](https://sammohr.dev/keyboards), and
  have a custom board mostly based on Sam's Clog V3 coming soon.

  > <span class="tangential">
  > Trivia: I barely know how to type QWERTY on a desktop/laptop keyboard at
  > this point. I've been using Dvorak for somewhere near 14 years that I can
  > remember, meaning I'm now in the "half+ of my life on Dvorak" club. I've
  > recently started considering some other layouts, perhaps [Hands
  > Down](https://sites.google.com/alanreiser.com/handsdown/home), but the
  > prospect of moving punctuation out of the top left at this point frankly
  > terrifies me. This is also why a brief attempt to learn Colemak-DH didn't
  > stick. I do, however, still use QWERTY on touchscreen phones, and believe
  > it's excellently suited there.
  > </span>

- For pointer input, I recently brought my [Elecom
  Huge](https://elecomusa.com/products/b07353dbp9) back into the fray after
  many years in storage. Other devices in the rotation include a [Ploopy
  Classic trackball](https://ploopy.co/classic-trackball/) and a [space gray
  Apple Magic Trackpad 2](https://en.wikipedia.org/wiki/Magic_Trackpad_2).

- My webcam is [some Aluratek "4K"
  thing](https://aluratek.com/products/live-pro-4k-hd-webcam-with-5x-digital-zoom-and-dual-stereo-noise-cancelling-mics)
  I bought for about 7 billion dollars during the lockdowns when there was a
  run on webcams, my microphone is an [Elgato Wave
  3](https://www.elgato.com/us/en/p/wave-3-black), and for on-camera lighting,
  I use two [RaLeno RGB key
  lights](https://www.amazon.com/gp/product/B0BJD1GXCW).

- Bulk storage is on three [Samsung T7
  Shield](https://semiconductor.samsung.com/us/consumer-storage/portable-ssd/t7-shield/)
  SSDs (2x 2TB, 1x 4TB), all running ZFS.

## Laptops

![It's a Thinkpad... what did you think it was going to look
like?](/laptop-2024-02-13.png)

My primary laptop is a [Lenovo Thinkpad X13S Gen4
AMD](https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadx/thinkpad-x13-gen-4-13-inch-amd/len101t0081)
with an AMD 7840U and 32GB of RAM. My only complaints about it in general are
that it's a bit too big (11-12" is my ideal, the X13S is very close to 14") and
the battery life is truly awful (~5hrs on a good day). It's otherwise
excellent: plenty of port selection, fast USB-C charging, matte 16:10 aspect
ratio screen, a fairly decent keyboard (I've used better, but almost never on a
laptop), and a huge, smooth trackpad. (Unlike many Thinkpad fans, I couldn't
care less about the trackpoint).

> <span class="tangential">
> For those curious, the hostname is `nocturnes`, after [the Silicone Soul
> song](https://songwhip.com/silicone-soul/les-nocturnes).
> </span>

Elsewhere in my arsenal of portable machines, I still own two barely-usable machines:

- A [Samsung Chromebook
  Pro](https://www.samsung.com/us/computing/chromebooks/12-14/samsung-chromebook-pro-xe510c24-k01us/)
  from 2017, which was bootloader-unlocked, made to run Coreboot, and still
  barely runs Void Linux x86\_64-musl. While the 3:2 aspect ratio has always
  been incredible, the keyboard has always been unbearable in both size/layout
  and feel, and at this point, the 4GB of RAM and extremely slow Skylake m3
  processor make the system largely unusable for any "real work". I'm not sure
  what its future is.

- A [Lenovo
  C630](https://www.lenovo.com/us/en/p/laptops/yoga/yoga-2-in-1-series/yoga-c630-13q50/88ygc601090)
  fold-back Qualcomm-based ARM laptop. It has at various points run Gentoo and
  Void Linux, but it's never been usable in any state that wasn't plugged into
  a USB-C dock with ethernet. It's been completely unused since late 2020, so
  at this point I doubt the battery works for long, and the OS will need fully
  re-imaged. (If you, dear reader, can put this thing to better use, it's yours
  for the price of shipping anywhere in the US).


## Servers

Most of my services are hosted on a small fleet of Linode (er, "Akamai Cloud" -
whatever, corporate) VPSes, all running Alpine Linux and [managed with
Terraform](https://git.sr.ht/~klardotsh/klar.sh/tree/master/item/terraform),
though all config and state management is currently manual (no Nix, Kubernetes,
etc. here - I use those when I'm paid to. Ever hear about how [cobblers'
children have no
shoes](https://english.stackexchange.com/questions/159004/the-cobblers-children-have-no-shoes)?).

A few things run on a [Raspberry Pi
4B](https://www.raspberrypi.com/products/raspberry-pi-4-model-b/) here at home,
notably, [Home Assistant](https://www.home-assistant.io/) to control a litany
of Zigbee devices (light bulbs, plugs, temperature/humidity sensors, etc).

## Phones

> <span class="tangential">
> I HATE SMARTPHONES.<br/>
> I WANT ALL SMARTPHONES TO DISAPPEAR.<br/>
> I HATE MOSTLY-HAVING TO OWN ONE TO LIVE IN MODERN SOCIETY.<br/>
> I HATE WHAT THEY'VE DONE TO MODERN SOCIETY.<br/>
> FUCK SMARTPHONES.
> </span>

Okay, now with that out of my system... I currently use a [Pixel
7a](https://store.google.com/us/product/pixel_7a) which runs
[crDroid](https://crdroid.net) with [MicroG](https://microg.org) and no Google
services. It perpetually brings two Nolan Lawson articles [^1][^2] to front of
mind, for sure... especially since I actually have to keep my prior phone, a
Moto G Stylus running stock Googled Android, around to log into certain systems
at work. Sigh. (yes, YubiKeys exist, yes, I used to use them at every startup
job I held between 2018-23, no, the enterprise org I now work for doesn't allow
them as replacements for the closed-source auth stack we use. Sigh again.)

[^1]: [Living With An Open Source Phone, 2017](https://nolanlawson.com/2017/11/27/living-with-an-open-source-phone/)
[^2]: [Tech Veganism, 2019](https://nolanlawson.com/2019/05/31/tech-veganism/)

Also somewhere in my piles of rotting tech shit are three PinePhones. They're
all slow, fragile, horrible shit, on both the hardware and much of the software
sides, don't buy them.

## Other Gadgets

- I am still frequently found wearing a [Pebble 2 smartwatch from
  2016](https://www.wareable.com/smartwatches/pebble-2-review), before
  smartwatches pivoted to being health trackers (I don't care about this) with
  LCD/OLED displays (I actively don't want this) and short battery life (this
  Pebble 2 which has been abused to hell and back, including spending 2 years
  in a box with zero charge whatsoever, still gets 3-5 days on a charge). At
  one point I tried moving to a [Watchy](https://watchy.sqfmi.com/) as a
  replacement, but at the time, the device was far too fragile and the software
  too buggy. I no longer own the Watchy, and frankly, would happily buy a
  new-old-stock Pebble 2 at its original list price even today. It, and the
  Pebble Steel I owned before it, is still the gold standard in smartwatches to
  me.

  Alas, my next watch purchase will almost certainly not be a smart one given
  the Watchy's fragility (portable devices in my life often get tortured
  mercilessly) and Pebble being a long-gone company: it will be a dumb watch,
  possibly a [mechanical
  watch](https://en.wikipedia.org/wiki/Mechanical_watch).

- I still own a [reMarkable v1 tablet](https://remarkable.com/). It gets very
  little use these days other than as an occasional EPUB reader. Bloated
  software updates have made this usecase unbearably slow and bug-ridden on
  this device; it's pretty clear this v1 is bound to become e-waste unless I
  can figure out an alternative OS situation for it. If you know of ways to
  turn a reMarkable v1 into a better e-reader (and ideally not *completely*
  nuke the stylus, though I use it fairly rarely), please [get in
  touch](/contact.html)!

- I still own a Kindle Paperwhite from about 2015. At this point I have no idea
  if it even boots: about once a year, I get it out of storage and charge it,
  and then promptly decide to read on some other device (or no device... I'm
  bad about reading, y'all). If you know of good uses for a nearly-decade-old
  Kindle Paperwhite (maybe they're rootable now and can be made to run
  alternative firmwares?), please [get in touch](/contact.html)!

## Audio

> <span class="tangential">
> Beware the rabbit hole that is ["audiophile"
> culture](https://klar.sh/living_thoughts/audio_gear_audiophilia.html). I own
> what I own because it performs well and otherwise scored well on my personal
> rubric in every category I cared about, including repairability. I don't
> necessarily endorse _you_ buying the hardware I use, and if you do snag any
> of this stuff, I definitely endorse finding used deals on one of the many
> audio gear marketplaces. You can save hundreds to thousands of dollars.
> </span>

When at my home office, I listen to either my [Edifier R1280T
speakers](https://edifier-online.com/us/en/speakers/studio-r1280t-2.0-powered-bookshelf-speakers)
or one of a few [ZMF over-ear headphones](https://www.zmfheadphones.com/) I
own, with digital-to-analogue translation and headphone amplification handled
by an [RME ADI-2 DAC FS](https://www.rme-usa.com/adi-2-dac.html). At this
point, barring an upgrade to the speakers (I'm eyeing some KEF Q150s or Polk
ES10/ES20s some day), my home office audio stack is considered "complete
enough". I'm mostly done trialing too much new gear and happy with where I've
landed.

On the go, I listen to [Truthear Zero IEMs](https://truthear.com/products/zero)
via a [Qudelix 5K](https://www.qudelix.com/products/qudelix-5k) DAC/amp (which
works as both a USB-C device and a Bluetooth sink). I may consider adding
another IEM or two to this list eventually, but otherwise am, again, largely
happy with where I've landed.

> <span class="tangential">
> I've also crowdfunded the [Tangara portable media
> player](https://www.crowdsupply.com/cool-tech-zone/tangara), which I hope
> will help me use my phone for fewer tasks, and use open-source task-dedicated
> hardware for listening to music on the go. Also, it was just nice to support
> an internet pal's OSHW venture :)
> </span>

## Software

As a non-exhaustive list:

- Linux as my OS on effectively everything, somehow or another
- [neovim](https://neovim.io/) and [helix](https://helix-editor.com/), for text
  editing
- [sway](https://swaywm.org/), for window management
- [cmus](https://cmus.github.io/), for music playing
- [newsboat](https://newsboat.org/), for feed reading
- I basically hate all chat apps these days, but by choice or by force I can
  generally be found on [Matrix](https://matrix.org), Discord, IRC, Slack,
  [Zulip](https://zulip.com/). [^3] For IRC I use
  [catgirl](https://git.causal.agency/catgirl/about/catgirl.1).

... and whatever else you find [in my
dotfiles](https://git.sr.ht/~klardotsh/dotfiles).

I tend to build software using (in no particular order): Rust, Zig, Python,
TypeScript, and plain old shell scripts. Oh, and I'm working on [my own
language](https://sr.ht/~klardotsh/gale/), too, I guess.

[^3]: And of course all of these require separate windows on my screen these
    days because the golden era of using Pidgin to merge all protocols into one
    sensible UI is long gone (in Discord's case, you'll get banned for even
    trying, which IMO should be damn near criminally chargeable for a company
    to enforce).

