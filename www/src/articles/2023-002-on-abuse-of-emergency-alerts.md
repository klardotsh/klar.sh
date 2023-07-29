# On Abuse of Emergency Alerts

> Or: _The RCMP gave me a series of panic attacks tonight and so my second-ever
> blog post is dedicated to them and the CRTC_.
>
> When: _July 20, 2023_
>
> Where: _Galiano Island, BC, Canada_


Today I learned more about the Emergency Alert System equivalent that's built
into the LTE (mobile data) protocol than I ever wanted to know. Unfortunately I
learned these things because the RCMP (the Mounties 🇨🇦) have insisted
on giving me multiple panic attacks tonight. What a great way to spend my last
two weeks in Canada, eh? 🙃 So anyway, nerd tangent inbound
about how emergency alerts work on mobile phones, and how Canada abuses their
system, if that's the kind of topic you like a lightning talk in text form
about!

---

Right, so. Many of us who live or grew up in the US are probably familiar with
the TV and radio alerts that go out when Bad Stuff's Going Down: growing up in
the Midwest for example it was a near-certainty that I'd hear the severe
thunderstorm warning and/or tornado watch/warning alerts on FM radio a few
times a month all summer. Fast forward to modern day, and of course all this
stuff is now digitized because FM radios are basically delegated to use in cars
and... that's about it.

Turns out these alerts are baked into the LTE spec in a system called WEA,
formerly CMAS. [WEA is high-level summarized
here](https://www.interoptechnologies.com/wireless-emergency-alerts), but
basically it's a special quasi-SMS message (actually some older Android
versions literally display them as such) that has a 90-360 character summary of
an emergency, and, *importantly to this problem today*, an _alert level_.

WEA has a few levels of alert:

* Test messages, which can be fully disabled and ignored by users on their
  devices.

* Public Safety and Imminent Threat alerts (two categories, I'm lumping them
  into one), which is your garden variety severe weather etc. alerts like from
  our FM radios of yore. [^1]

* AMBER Alerts, which I think everyone from US+Canada will be familiar with but
  for anyone who isn't (or isn't from here),
  [Wikipedia has you covered](https://en.wikipedia.org/wiki/Amber_alert)

* Presidential Alerts, which have been used exactly one time EVER in the US: a
  test in 2018. Otherwise, this is reserved for like, 9/11-caliber stuff, or
  nuclear attacks, or other society-ending catastrophes.

[^1]:   I've also gotten these for other reasons: for example to let me know
    that the area I was standing in was under a likely-unconstitutional curfew
    somehow effective in _negative 15 minutes_ (?? math how does it work ??)
    and that I could be subject to arrest if I stuck around. I wasn't arrested,
    and the rest is a long story for another day maybe - but do any of us
    really want to relive 2020 memories?

The important thing to note is that while tests and AMBER alerts can be opted
out of *completely* and while weather alerts and public safety alerts can be
either opted out of, or at least silenced/made to respect your
vibration/do-not-disturb settings, at an OS level, apparently per the WEA spec,
Presidential Alerts cannot. I guess this makes sense to some degree: if there's
a nuke incoming, as much as I personally don't even want to know, I respect
that most folks probably *do*. [^2]

[^2]: Another bit of context is that the WEA spec apparently allows geofencing
    these notifications, which is how, for example, Seattle Police sent that
    aforementioned "GTFO or get arrested" alert to my phone in 2020, but my
    friend who lived just up the hill from there had no such alert. Evidently
    the payload for these things is an XML document that can identify various
    bounding boxes (not exactly sure how those work, I haven't dug in yet).

_So what the hell does this have to do with the Mounties?_

---

Today in BC there was, sadly, [an AMBER alert for some presumed-abducted
kids](https://www.cbc.ca/news/canada/british-columbia/amber-alert-surrey-rcmp-1.6911711),
who were last seen in Kamloops, issued by Surrey RCMP. I should have never
known about this at all, because I have AMBER alerts disabled on my phone
entirely (I've been living in remote, far-flung places for the past two years,
I'm of no use helping find anyone - hell, this week I'm at anchor somewhere
there's almost no cars at all, and I'm miles from any ferry terminal. There's
barely cell signal - without Starlink, I wouldn't even be able to work from
here).

_EXCEPT!_ Canadian AMBER alerts aren't filed on phones as AMBER alerts for some
godforsaken reason.

You know what they're sent out as?

NATIONAL ALERTS. YOU KNOW. THE NUCLEAR WARNINGS. THE ONES YOU CAN'T SILENCE.
THE ONES THAT PLAY HORRIFYING APOCALYPTIC SOUNDS WHEN THEY GO OFF BECAUSE
THEY'RE MEANT FOR THE END OF DAYS. [^3]

[^3]: Also, tangentially, these alerts are also geofenced to *the entire
    province*, and this is also apparently a Canada-wide problem. Ontario does
    the same nonsense. BC is... massive. Like, "the entire space between the
    lower 48 and Alaska, west of the Rocky Mountains" big. And a non-trivial
    amount of it is made up of islands. So someone nearly 600 miles north of
    here would have gotten the same 6 alerts I did today about this.

AND THEN THEY SENT OUT SIX OF THEM. (Two in the 3pm hour, one in the 4pm hour,
two in the 11pm hour, and one past midnight, before I finally gave up and
turned my phone off, scared of my own shadow from all the jump scares in a dark
silent boat late at night).

Apparently this is in some way made mandatory by the
[CRTC](https://en.wikipedia.org/wiki/Canadian_Radio-television_and_Telecommunications_Commission),
which is basically Canada's FCC. Kinda. I don't really know all the details,
but [some person on Reddit had a bit of a scoop on the whole
thing](https://www.reddit.com/r/ontario/comments/boxx11/how_to_disable_amber_alerts/).
That same Reddit post also talks about the only way to disable the alerts: by
`adb shell` ing into your phone and disabling some system services. Or the good
old fashioned way, which is what I'm choosing today since `adb shell` is
inconvenient right now: **turning my phone off entirely**. Unfortunately, my
phone also happens to be my alarm clock, like many modern humans. My physical
backup clock is out of service (gotta find the power adapter, wherever that
went).

And so anyway, this is why the Mounties might make me log on later than usual
to work tomorrow 🙃. And why this part of the LTE spec is absolutely BROKEN:
why should any government have the power to induce panic attacks over anything
*less* than the end of days at 11pm, midnight, 3am, *whatever*?

Thanks for coming to my TED talk about how, somehow, "my cellphone doesn't make
nuclear alarm noises six times a day" is going to be one of the biggest perks
about being back home in the US in a couple weeks.
