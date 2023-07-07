# On Starting

> Or: _"Fuck It!" and the duality of applying this mentality to only certain
> facets of life._
>
> When: _July 7, 2023_
>
> Where: _Saysutshun (Newcastle Island) Marine Park, Nanaimo, BC, Canada_

Well would you look at that: a blog post. However, if you'll look at [the
source code for this site](https://git.sr.ht/~klardotsh/klar.sh), at least at
the time of writing, you'll find no blog-specific tooling here to help me. In
fact, you'll find only a fairly small wrapper script (helpfully [sourced from
elsewhere](https://romanzolotarev.com/ssg.html)) around `lowdown(1)` and a
`Makefile` to help shrink images and so forth. Otherwise, there's nothing to
help tag these articles into categories, there's nothing to auto-generate an
Atom feed, there's nothing to deploy this automatically. And yet, here I write.

This is long overdue: I've been talking about wanting to take part in things
like `#100DaysToOffload` for months, and about wanting to "get a blog going"
for literally years. Actually, we might be coming up to closer to a decade of
me half-assedly murmuring something to the effect of "I'll get a blog going
about `<thing>`" with about the same intentionality as someone telling
their partner they'll "totally" get out of their warm and cozy bed in the
morning to help with whatever the chore du jour is, while already drifting
back off to a peaceful slumber. My "peaceful" "slumber", I suppose, was
probably microblogging, or other dopamine-driven social media over the
years. Case in point, one of my many TODOs for this site is to backport a
ton of longer-form Facebook posts to here and intersperse the images. I
probably have a few dozen such pages to get to.

I'm not going to blame this all on like-button-fueled dopamine rushes, though,
because I don't think that's actually the entire situation. I've been slowly
pulling away from traditional[^1] social media anyway for a while. I think
there's a combination of UX and psychological factors at play in this as well,
and that brings us to today's *real* topic: self-induced startup costs and the
empty canvas effect.

---

I find that hobbyist software folks and artists[^2] I've met often fall into
one of two categories:

- Those who, when given a blank canvas, somehow manage to take it, run with it,
  and make something beautiful... or at least *something*... relatively
  quickly. I've met a few of this type. They're incredible forces of nature and
  absolutely inspiring to be around. Particularly, these folks can't be arsed
  to care about failing. They're going to just *go*, and figure out the rest
  later.

- Those who see a blank canvas and *freak the fuck out*, because of the
  immensity of the possibilities that lie ahead, and perhaps also because of
  the desire to _get things right_.

I, alas, fall into the latter camp for hobby work. It's been a lifelong curse:
outside of work and volunteer spaces, overcoming startup inertia is *hard*. One
good look at [my GitHub repositories
list](https://github.com/klardotsh?tab=repositories) can clue one into this:
this list largely resembles a graveyard of ideas past that typically never got
off the ground for one reason or another. Maybe it was [trying to use a new
language for the sake of learning it](https://github.com/klardotsh/resonator)
and instead getting neither a (significantly) deeper understanding of Haskell
*or* a music library manager out of it. Maybe it was [getting partway through
the initial prototype](https://github.com/klardotsh/gawsh/tree/init) and then
[suddenly changing everything, including the implementation
language](https://github.com/klardotsh/gawsh/tree/init-otheridea), before the
MVP had ever published a public artifact [^3]. Or maybe it was one of the
countless other half-baked ideas that never made it to a text editor at all: a
repo made, high-level ideas bounced around, and then... what? And then what?

There's a well-known saying in English (and a few other languages): ["perfect
is the enemy of
good"](https://en.wikipedia.org/wiki/Perfect_is_the_enemy_of_good). It's a
saying I like to say to _other people_ all the time, like when encouraging
_someone else_ to get their own cool thing off the ground, or to get a project
underway at work. "Yeah man, whatever, we can refactor it down later, let's get
some kludgey shit thrown together for now to get something going!" I've
learned, however, that, as with many adages I offer to folk, I'm actually
pretty awful at following the advice myself[^4], and I'm *especially* bad at
following it when left to my own devices. I've been working to change this, and
as part of working to change it, I've had to give some thought to *why* I am
this way. My theory on being such a perfectionist in my personal projects is
somewhat twofold:

First, anxiety of publishing things in the public realm. "Nononono dude, I
don't want to have horrible code up on my GitHub, I'd rather have *no* code on
my GitHub, at least then employers will assume I don't write code at all in my
spare time, rather than writing shitty code". I've found this side of the
reasoning has died down significantly in more recent years as a function of age
and career growth: I no longer (as badly) feel that I have something to prove
to the industry. I'm here, I've been doing this thing for a good while now, and
I'm decent at it. Cool. If I have some shitty code on my GitHub or my SourceHut
or whatever, *who cares?!* It lives alongside other *actually decent* code I've
published, either myself, or on behalf of companies I've worked for.

Second, a sense of agency - agency I longed for in day-to-day work. In
industry, typically one will be using whatever the flavor of the week toolchain
and language is, or whatever the team agreed on a gazillion years before you
showed up, or whatever some manager thinks they can easily hire for, and
depending on your creative interests as a developer, this may or may not
fulfill you. I know for me, it often did not: reading about languages like
Haskell and Rust pushed my brain to think in ways I previously hadn't, and then
going back to whatever my dayjob of the time was to write, say, RESTful CRUD
endpoints in Python, was a touch depressing. So in my free time, where I got to
write all the rules about what got used and why, I *lunged* at the opportunity
to try *all the things, all the time*, and I wanted to see how to use those
things to _write software better_. This now meant I was, and little did I
realize the gravity of this until I started doing all this reflection, fighting
a war on two fronts of sorts: not only did I want to ship a "product" (or a
toy, or a whatever), but I also needed to climb this giant mountain of learning
a new tool... **and** learning that new tool well enough to do things
"right"... whatever that meant.

---

Like many[^5] folks in software, I have a complex and complicated life outside
of software and its development. Some might say I wear lots of hats or have
gotten to live lots of chapters in a very short time. A saying that was for a
long time (and in some circles still is) associated with me is "strong fuck-it
reflex", referring to the long list of things I'll say "oh *fuck it*, why not"
to. This list includes, but is not limited to, some major items:

- Jumping into FIRST play-by-play game announcing despite having a reputation,
  at the time, for being a generally quiet and reserved person
- Moving out of my hometown to the third-biggest city in the country, this
  decision made *before I had ever once set foot in Chicago*[^6]
- Deciding to join a seed-round startup in spite of its huge risks
- Buying a sailboat and learning how to sail on Puget Sound - in that order
- Moving onto said sailboat while it was still largely in a state of
  construction.

All of these share a common trait: there comes a day when you've just gotta
*decide*. Launch or no launch? Stay where it's safe, or jump into the unknown?
Consistently in my meatspace life, I find that I opt for "jump into the
unknown" - even on less life-upending things like deciding to go on dates with
someone, I find that, given a sliver of interest to begin with, my answer is
generally likely to be "yes" until proven it should be "no". And so I jump in
head-first. And regardless of how any of these major decisions (or the more
minor ones!) have turned out in the long run, I consider none of them failures
in the grand scheme. Maybe the objectives I set out to achieve by jumping in
(if there were any beyond "fuck it" to begin with, which isn't always
guaranteed) weren't met, but I can consistently say that I've learned something
from having this reflex (perhaps more politely called a "just say yes" reflex,
which I vaguely recall is a concept some business book teaches to folks to whom
this doesn't come naturally).

Great - so... if this is how I am away from the screens, why not be this way
*at the screen*, too? Why can't I be that first type of hobbyist dev I alluded
to, rather than the second?

---

Writing is one of these aforementioned cursed "blank canvas problems". Every
blog post, every book, every newspaper column, every technical manual, every
copypasta shitpost, they all start with something vaguely approximating a blank
white page onto which a series of characters can eventually be spewn. This is,
to put it gently, an intimidating process. There's ways to make it less
painful, like doing an upfront outline before writing any of the prose[^7], but
even that outline has to start somewhere!

Getting the infrastructure for a blog or personal website set up is another
"blank canvas problem". You have to somehow traverse the void between an empty
directory on a filesystem and having some documents written, and between an
empty body in an HTML document and actual readable pixels fit for human
consumption[^8].

Solving *both* of these problems **at the same time** is the herculean task
I've been up against for years, with the added self-own of explicitly *not
wanting this site to look like a templated blog site*. Because, you know, if
you're already solving two hard problems, why not make it a billion times
harder on yourself and *willfully exclude all the wonderful options that
already exist out there with the goal of trying to bridge those two voids for
you*? Genius.

Thus, for quite a long time, I took the path that solved at least one of these
problems *in the worst way*: "hey look! an input box just sitting there waiting
for me to type in, thanks Facebook or Mastodon or whatever! I can put off this
blog thing yet another day". And procrastinate I certainly did, much like
how I'll also procrastinate cooking if there's anything prepared laying
around, or will procrastinate doing the dishes if there's even a single
fork *anywhere* that's still clean. To some degree, I think this is human
nature: we've evolved to take paths of less resistance and less risk and
less energy expenditure, often for good reason. But I'll still call it for
what it is: laziness combined with a fatal hobby-perfectionist streak.

---

Finally, [several months
ago](https://git.sr.ht/~klardotsh/klar.sh/commit/268c72523015447b37185e3a7c6962373d78386e),
I did something very important: I decided to sit perfectionism aside. _Who
cares if the CSS isn't rendering quite right on all devices? Who cares if the
Markdown parser has opinions slightly different than mine? Who cares if I don't
have a fancy build script and deployment setup to get these HTML files from my
disk to the Internet? Who cares if everyone looks at the code that powers this
stuff and laughs their asses off?_ **Just Do It**.[^9] It's taken a while, but
this place finally has a few pages worth actually reading, and the startup cost
of making new ones is ever-decreasing.

I'm missing some admittedly really nice to have features I'd love to some day
backfill: there's no way to link to other pages in a way that isn't liable to
break if a page gets renamed. There's no automated RSS/Atom feed of site
updates (short of following the Git repo, I guess). The images of the site are
all stored bare in the Git repo rather than being in LFS or similar, where they
belong. The deploy process is literally a manual `rsync(1)` incantation I keep
in my shell history - it's not even in a shell script or `Makefile` yet.

And yet... it's mine. It's unique. I achieved that "it's not off-the-shelf"
goal, and I have something tangible on the internet. Unlike, say,
aforementioned `gawsh`, any rewrites or refactors I do now, are in the context
of *already having a working thing to enjoy in the meantime*. The urgency of
the refactor is entirely my own decision now, and it doesn't impact _having the
damn thing shipped already_.

Months have gone by with the site existing, but I had still delayed writing any
long-form prose, in part because of how relentlessly busy I've been, but in
part because I also *didn't know what I wanted to write about to inaugurate the
blog section*. Here we go again with blank canvas problems, hey? Sure, there's
a navbar now, but the articles section is empty - what to fill it with?! So
tonight I decided to apply the same lesson I've been trying to pound back into
my head in hobby software development over the past year or so. I decided to
sit down and write this article in a single take, top to bottom. I've made only
minor edits to the opening paragraph, and a proofreading pass over the whole
document, and I'm about to commit this Markdown file to the Git repo, run the
`Makefile`, and push this thing - whether it's a work of art, a total shitshow
I'll wince at in a year, or (most likely) something in between - up to the
public web.

That lesson? **Fuck it. I'm starting.**


[^1]: Can we call any of this mess "traditional"? My sense of time is
    completely screwed I guess: I'm somehow from that bizarre cusp set of years
    where I understand why pencils and cassette tapes go together (and remember
    having to reverse VCR movies before returning them to the
    honest-to-god-it-existed-kids-I-promise Blockbuster), have watched the
    entire rise and fall of Google+ and Twitter (too soon?), and have been
    terminally online for longer than many of the robotics students I volunteer
    with have been alive. Facebook feels "traditional" in that sense: I recall
    using netbooks at the Boy Scout Jamboree when I was like 13 years old to
    access Facebook and its chat (which was still the era when it was
    XMPP-compatible, RIP to those days). That was - literally - half my life
    ago. "Traditional" seems to fit.

[^2]: I'm intentionally scoping this to hobbyist works because, with some
    exceptions, most hobby work is done without a financial incentive or
    imperative, and further, without external managers imparting milestones and
    deadlines upon us that help shape the early days of a project. At work, I'm
    generally well-known for being the kind of guy who can get a greenfield
    project off the ground quickly, but this discounts both the sense of
    urgency that comes from knowing _I have to build this thing to stay housed
    and fed_, and the upfront, often team-scale planning that goes into
    brainstorming up such tools - a preemptive brainstorming that is often
    lacking from my hobby work for one reason or another. Diving into this
    could easily become its own article, so I'll stop here.

[^3]: It actually gets worse from here: after moving from the Rust monolith to
    the Makefile+Zig architecture that currently exists in that `otheridea`
    branch (and I do hold that this migration was the technically-better one:
    the perf numbers speak for themselves), I finally got frustrated with Zig
    enough to go down what has now been a two year rabbit hole of programming
    language design in trying to find the ideal balance of strong typing,
    correctness checking, speed of implementation, usable syntax, and
    understandable internals, ultimately leading to what is now slowly shaping
    up as [Gale](https://sr.ht/~klardotsh/gale/). In many ways I don't regret
    it, but in other ways, I have to laugh that I somehow have taken two years
    to build something like [stagit](https://codemadness.org/stagit.html) by
    way of building a *whole programming language with which to eventually
    built that Git tree renderer* along the way.

[^4]: Relatedly, we'll all (it's all, right? it's not just me...) tell our
    friends what red flags to look out for when job hunting or dating, and yet
    will totally wind up taking the wrong job or dating the wrong person in
    spite of that advice we dole out.

[^5]: But unfortunately not all...

[^6]: I did eventually go visit the place 6 days before I loaded my car up and
    drove north-northwest from Dayton, at least. And I did love my years there:
    this was a decision that paid off, big time.

[^7]: Guess which article had no such outline earlier this evening?

[^8]: Or at least fit for ChatGPT to gobble up and regurgitate into some
    nonsense that someone will wind up citing in a paper with credit to the AI
    rather than to the original author.

[^9]: [Obligatory Shia LaBeouf](https://www.youtube.com/watch?v=ZXsQAXx_ao0)
