# Software Projects I've Worked On

This is a non-exhaustive list of projects I've worked on over the years, in a
format loosely inspired by [@jcs](https://jcs.org/projects). As a general rule,
this list doesn't include projects I've written on behalf of employers, even if
those projects were open source (for that stuff, see [my resume](/resume.html)).
It also doesn't include a myriad of partially-baked ideas that might have gotten
a Git repository and a few (or even few dozen) commits but ultimately went
nowhere: maybe I need a `graveyard.html` for those...

### Active

<div class="projects-project flexy">
<div class="flex push-left-30">
<h4 class="title"><a href="//sr.ht/~klardotsh/gale">Gale</a></h4>
<p class="tenure">
<span class="dates">2021 - present; Zig</span>
</p>
</div>

<div class="description flex">
<p>
An experiment in a stack-based-to-the-logical-conclusion, type-safe-enough,
ultra-high-level Forth-Lisp-Rust-Lua spiritual hybrid of sorts. Very much a work
in progress.
</p>
</div>
</div>

<div class="projects-project flexy">
<div class="flex push-left-30">
<h4 class="title"><a href="//git.sr.ht/~klardotsh/kaboom">kaboom</a></h4>
<p class="tenure">
<span class="dates">2023 - present; Rust</span>
</p>
</div>

<div class="description flex">
<p>
A CLI to provide the absolute basics of authoring an Atom feed as an XML file on
disk, targeted towards DIY bloggers using static site generators (or just plain
old HTML files) that don't already generate Atom feeds.
</p>
</div>
</div>

<div class="projects-project flexy">
<div class="flex push-left-30">
<h4 class="title"><a href="//git.sr.ht/~klardotsh/what-the-ref">What The Ref?</a> <a href="//whattheref.info">(visit)</a></h4>
<p class="tenure">
<span class="dates">2023 - present; Rust</span>
</p>
</div>

<div class="description flex">
<p>
A quick-reference tool for FIRST Tech Challenge referees who otherwise have to
string together numerous sources of rules and interpretations.
</p>
</div>
</div>

### Not My Direct Focus, But Maintained

<div class="projects-project flexy">
<div class="flex push-left-30">
<h4 class="title"><a href="//git.sr.ht/~klardotsh/begrudge">begrudge</a></h4>
<p class="tenure">
<span class="dates">2021 - present; Zig</span>
</p>
</div>

<div class="description flex">
<p>
A simple converter of ANSI-escaped terminal output into class-annotated HTML for
web rendering.
</p>
</div>
</div>

<div class="projects-project flexy">
<div class="flex push-left-30">
<h4 class="title"><a href="//git.sr.ht/~klardotsh/fork-off-public-license">The Fork Off Public License</a></h4>
<p class="tenure">
<span class="dates">2022 - present</span>
</p>
</div>

<div class="description flex">
<p>
A tongue-in-cheek software license that has never, to my knowledge, been used on
an actual project, but has made many dozens of people laugh, and that's all it
had to do.
</p>
</div>
</div>

### Adopted Out To The Community

<div class="projects-project flexy">
<div class="flex push-left-30">
<h4 class="title"><a href="//github.com/KMKfw/kmk_firmware">KMK</a></h4>
<p class="tenure">
<span class="dates">2018 - 2023 (ish); CircuitPython</span>
</p>
</div>

<div class="description flex">
<p>
A mechanical keyboard firmware that is fully implemented in CircuitPython,
where the source code of the board *lives on the board* and can be edited
freely over the USB MSC interface ("flash drive").
</p>

<details><summary>What do you mean "2023 (ish)?"</summary>
<blockquote>
<span class="tangential">
Putting dates on this is tricky: the core development spanned 2018-19, I
then backed off a good bit but had "some" involvement for several years,
and finally some time in 2022-23ish I started taking active steps to enable
the community to choose the project's destiny on their own (including
appointing new admins to various tools used). As of 2023, I consider myself
something of a retired advisor to the project: I'm happy to help resolve
disputes or provide mentorship and guidance, but have zero input on the day
to day runnings of the project, and frankly almost certainly could not
meaningfully contribute code to the current codebase without relearning it
from scratch.
</span>
</blockquote>
</details>
</div>
</div>


### Completed/Abandoned

<div class="projects-project flexy">
<div class="flex push-left-30">
<h4 class="title"><a href="//github.com/klardotsh/qmk_emote_macro_generator">QMK Emote Macro Generator</a></h4>
<p class="tenure">
<span class="dates">2018; Rust</span>
</p>
</div>

<div class="description flex">
<p>
A preprocessor of sorts to generate QMK mechanical keyboard firmware code to
make the keyboard type out Unicode emojis. While the source code still builds
(thanks, Rust 1.x guarantees!), I'm not sure if the code it generates still
makes any sense against any QMK codebase of the 2020s.
</p>
</div>
</div>

<div class="projects-project flexy">
<div class="flex push-left-30">
<h4 class="title"><a href="//github.com/klardotsh/git-staredown">git-staredown</a></h4>
<p class="tenure">
<span class="dates">2017; Python</span>
</p>
</div>

<div class="description flex">
<p>
A utility to provide an analogue to `git blame` for GitHub pull requests, allowing
associating a commit with the pull request it came from. This has long since
bitrotten away from various library and API upgrades, and targeted a now-EOL
Python version. Please don't use this.
</p>
</div>
</div>

