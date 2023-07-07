# Uses

This is a living document in the spirit of [uses.tech](https://uses.tech) and
[Uses This](https://usesthis.com) where you'll find a rough rundown of the
hardware and software that makes up my daily working stack, and (where
relevant), what my dream setup would be (in my current state of mind, at
least!). If you're looking for what hardware my boat uses, instead, [see her
dedicated page](/cloudy-day.html).

> <span class="tangential">
> I'm *constantly* changing my setup and tinkering with things on a monthly or
> at least quarterly basis in some form or another. The history of this page is
> all [in version
> control](https://git.sr.ht/~klardotsh/klar.sh/log/master/item/www/src/now.md),
> that history may be useful or entertaining or both.
> </span>

Most recent update: `2023-07-06`

## Primary Desktop Setup

> For those curious, the hostname is `woods`, after [the Bon Iver
> song](https://www.youtube.com/watch?v=MUGKbuWMqgU).

- [Beelink
  GTR6](https://www.bee-link.net/products/pre-order-beelink-gtr6-6900hx-first-quad-8k-mini-pc)
  (AMD 6900HX, 32GB RAM, 1TB SSD). It's not perfect by any means - the fans are
  loud as hell and there's a really bizarre USB-induced stutter every so often
  that causes audio and input device dropouts. Speaking of USB, there's not
  nearly enough ports, either. But it gets the job done, and draws a relatively
  modest 30-50W under typical loads, compared with 120W+ at idle on the ITX rig
  this mini-PC replaced (though compared to 28W at full tilt for modern ARM
  machines, it's still hefty). I will likely, some day, look to replace this to
  resolve the noise and power draw concerns, but I'm not in a huge rush.

  This machine runs Void Linux x86\_64-glibc (for now) on a ZFS root.

  <details>
  <summary>My dream device in this category...</summary>
  I'm not even sure any more - I guess give me an ARM64 or RISC-V rig with
  32-64GB of RAM and a GPU capable of playing things no more intensive than
  Minecraft, and make it draw less than 30W at full tilt. Now make it run Linux
  and/or FreeBSD and/or OpenBSD well, and let it be powered off DC easily to
  avoid AC inversion costs in DC-native environments. At this point, the only
  currently-available devices that would fit the bill are probably the
  Qualcomm-based Windows Dev Kit 2023 ("Volterra"), which until very recently
  had nightmarish problems booting Linux, and a Mac Mini with a modded power
  supply (which still requires tons of work from the Asahi crew to be usable,
  so it's a bold bet). Or maybe one of those mythical RK3588-based SBCs that
  all seem to be vaporware...
  </details>

- [LG DualUp](https://www.lg.com/us/monitors/lg-28mq750-c-dualup-monitor)
  Monitor. I have the one with the less-fancy stand because the "normal" stand
  works better on the boat currently - though some day, I'd love to have that
  Ergo Stand and somewhere to mount it. Anyway, the 8:9 aspect ratio took some
  getting used to, but it's absolutely incredible. Think of this monitor as 2x
  21.5" 2560x1440 monitors stacked vertically with no bezel between. I can fit
  an obscene amount of stuff onto the screen at a time, but it takes up *tons*
  less physical space than the 34" 21:9 monitors I used to use.

  <details>
  <summary>My dream device in this category...</summary>
  I've been saying for years my ideal setup would probably be two e-ink
  displays of reasonable size, and an OLED display for watching video or
  otherwise colorized or high framerate content. I'm still interested in trying
  this, but every time I poke at Dasung and Boox's offerings in the standalone
  e-ink monitor space, they're just so horribly expensive that I can't justify
  the things, especially with enough physical screen space to be useful to me
  for dev work (2x 13" or one 21" or bigger panel). This DualUp has more than
  exceeded expectations so far, so for as long as I'm on the IPS/LCD screen
  train, I think this DualUp (and maybe a second one in the future) actually
  already meets the bill for a dream setup.
  </details>

- My input devices are a [Keebio Iris
  keyboard](https://keeb.io/collections/iris-split-ergonomic-keyboard) running
  my own [KMK firmware](https://github.com/KMKfw/kmk_firmware) (this Iris was
  built in 2018 and has survived mostly unmodified since then, still using the
  original Hako Royal Clear switches; only the microcontroller has been
  upgraded, to a ItsyBitsy nRF52840), and a [Ploopy Classic
  trackball](https://ploopy.co/classic-trackball/) (which runs whatever the
  default firmware was). Occasionally I'll also pull out my [Apple Magic
  Trackpad 2](https://en.wikipedia.org/wiki/Magic_Trackpad_2) in space gray.

  This category is probably the most likely to change soon: the keyboard is
  likely to get replaced by either a [Corne
  LP](https://boardsource.xyz/store/5f2efc462902de7151495057) or a [MoErgo
  Glove80](https://www.moergo.com/). Both use low-profile switches, which I'd
  like to give a whirl to reduce typing fatigue. Those "Choc" switches are also
  used in the MNT Reform laptop (see below).

- My webcam is [some Aluratek "4K"
  thing](https://aluratek.com/products/live-pro-4k-hd-webcam-with-5x-digital-zoom-and-dual-stereo-noise-cancelling-mics)
  I bought for about 7 billion dollars during the lockdowns when there was a
  run on webcams, my microphone is an [Elgato Wave
  3](https://www.elgato.com/us/en/p/wave-3-black), my desk lamp is [just
  horribly named but works
  great](https://www.amazon.com/Quntis-Computer-Reading-Auto-Dimming-Adjustment/dp/B08DKQ3JG1).

- Bulk storage is on three [Samsung T7
  Shield](https://semiconductor.samsung.com/us/consumer-storage/portable-ssd/t7-shield/)
  SSDs (2x 2TB, 1x 4TB), all running ZFS.

## Laptops

I technically have three of these, all in various states of dysfunction:

- A [Samsung Chromebook
  Pro](https://www.samsung.com/us/computing/chromebooks/12-14/samsung-chromebook-pro-xe510c24-k01us/)
  from 2017, which was bootloader-unlocked, made to run Coreboot, and runs Void
  Linux x86\_64-musl. While the 3:2 aspect ratio has always been incredible,
  the keyboard has always been unbearable in both size/layout and feel, and at
  this point, the 4GB of RAM and extremely slow Skylake m3 processor make the
  system largely unusable for "real work". It can run one or two tabs in
  Firefox before some start getting OOM-killed. Despite this, it's been my
  primary portable machine since the death of my XPS 13 some time in 2021, and
  was briefly my primary portable machine in 2017-18 prior to that XPS.

- A [MNT Reform](https://shop.mntre.com/products/mnt-reform) which has had a
  rather perilous life so far (first, having the display chip fried shortly
  after assembly, and second, fully discharging its battery cells due to lack
  of use for a month or two and predating the protected battery boards that
  prevent such discharge). It's never actually been used outside the house yet,
  and I wish I had the time to change that right now, but I don't. Most
  recently it ran 9front so I could play with that. (I'm not smart enough to
  understand Plan9, I think. Or it doesn't fit my ideals of UX. Or maybe both.)

- A [Lenovo
  C630](https://www.lenovo.com/us/en/p/laptops/yoga/yoga-2-in-1-series/yoga-c630-13q50/88ygc601090)
  fold-back Qualcomm-based ARM laptop. It has at various points run Gentoo and
  Void Linux, but it's never been usable in any state that wasn't plugged into
  a USB-C dock with ethernet. It's been completely unused since late 2020, so
  at this point I doubt the battery works, and the OS will need fully
  re-imaged. (If you, dear reader, can put this thing to better use, it's yours
  for the price of shipping anywhere in the US).

## Phones

> <span class="tangential">
> I HATE SMARTPHONES.<br/>
> I WANT ALL SMARTPHONES TO DISAPPEAR.<br/>
> I HATE MOSTLY-HAVING TO OWN ONE TO LIVE IN MODERN SOCIETY.<br/>
> I HATE WHAT THEY'VE DONE TO MODERN SOCIETY.<br/>
> FUCK SMARTPHONES.
> </span>

Okay, now with that out of my system... I currently use a [Moto G Stylus
2022](https://www.gsmarena.com/motorola_moto_g_stylus_(2022)-11282.php) because
it's what I could reasonably source locally on short notice (that would have an
unlockable bootloader) when my old Pixel 4a's GSM radio kicked the bucket and
refused to stay connected to towers anymore (the USB-C port was pretty shot,
too). Ironically, I've never had time to bother with de-Googling this phone so
the unlockable bootloader became moot anyway. This is the first phone I've used
the stock Google Creepware ROM on since 2017, and it comes with some serious
ups and downs. It brings two Nolan Lawson articles [^1][^2] to front of mind,
for sure.

[^1]: [Living With An Open Source Phone, 2017](https://nolanlawson.com/2017/11/27/living-with-an-open-source-phone/)
[^2]: [Tech Veganism, 2019](https://nolanlawson.com/2019/05/31/tech-veganism/)

Also somewhere in my piles of rotting tech shit are the old Pixel 4a (I thought
I'd want to pull files off of it, in almost a year now I never have bothered),
three PinePhones (they're all slow, fragile, horrible shit, on both the
hardware and much of the software sides, don't buy them), some other old Moto
phone I killed, and... probably other stuff. Cell phones are by far the most
fragile tech gear I've ever encountered: I've probably killed a dozen or so in
the past decade, and at this point I buy the cheap shit I know is only designed
to last a year or two anyway, because I know from experience that _not even the
more expensive stuff outlives it anyway_.

## Audio

Ahhhhh this rabbit hole. I've dabbled with everything from onboard headphone
jacks on terrible PC motherboards to headphones that retail for $4k USD. These
days my stack sits between those extremes, and is a series of compromises
mandated by cost, space, and power usage (the latter two particularly being
functions of my living space on a sailboat).

I use four IEMs:

- [Symphonium Meteor](https://www.symphoniumaudio.com/pages/meteor)
- [Unique Melody MEST MkII](https://www.uniquemelody.org/products/mest-mkii)
- [Raptgo Hook-X](https://www.linsoul.com/products/raptgo-hook-x)
- [Truthear Zero](https://truthear.com/products/zero)

... through two dongle-style DAC/amps:

- [Lotoo Paw S2](https://www.lotoo.cn/english/Hi_Fi_Player/PAW_S2/)
- [Cayin RU6](https://en.cayin.cn/features/7/124/488.html)

It does the job given the circumstances. I've grown to miss over-ear
headphones, though - I still own [HifiMan
Sundaras](https://store.hifiman.com/index.php/sundara.html) and might get back
into them soon.

I had a "my dream setup" section written here, but (1) my markdown processor
chokes on handling markdown inside a `<details>` element (presuming, I guess,
that it's not markdown inside an HTML element), and (2) it was half as long as
this entire page, so I'll kick that to its own article at some point. tl;dr:
Over-ear headphones, but not those that break the bank - or my neck.

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

