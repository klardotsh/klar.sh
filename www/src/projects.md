# Software Projects I've Worked On

This is a non-exhaustive list of projects I've worked on over the years, in a
format loosely inspired by [@jcs](https://jcs.org/projects). As a general rule,
this list currently doesn't include projects I've written on behalf of
employers, even if those projects were open source. It also doesn't include a
myriad of partially-baked ideas that might have gotten a Git repository and a
few (or even few dozen) commits but ultimately went nowhere: maybe I need a
`graveyard.html` for those...

## Active

- [Gale](https://sr.ht/~klardotsh/gale/) (2021-present[^1]; Zig): An experiment
  in a stack-based-to-the-logical-conclusion, type-safe-enough,
  ultra-high-level Forth-Lisp-Rust-Lua spiritual hybrid of sorts. Very much a
  work in progress.

[^1]: Under the name "gluumy" until early 2023, pronounced "gloomy".

## Not My Direct Focus, But Maintained

- [begrudge](https://git.sr.ht/~klardotsh/begrudge) (2021-present; Zig), a
  simple converter of ANSI-escaped terminal output into class-annotated HTML
  for web rendering.

- [The Fork Off Public
  License](https://git.sr.ht/~klardotsh/fork-off-public-license)
  (2022-present), a tongue-in-cheek software license that has never, to my
  knowledge, been used on an actual project, but has made many dozens of people
  laugh, and that's all it had to do.

## Adopted Out To The Community

- [KMK](https://github.com/KMKfw/kmk_firmware) (2018-2023[^2]; CircuitPython):
  A mechanical keyboard firmware that is fully implemented in CircuitPython,
  where the source code of the board *lives on the board* and can be edited
  freely over the USB MSC interface ("flash drive").

[^2]: Putting dates on this is tricky: the core development spanned 2018-19, I
    then backed off a good bit but had "some" involvement for several years,
    and finally some time in 2022-23ish I started taking active steps to enable
    the community to choose the project's destiny on their own (including
    appointing new admins to various tools used). As of 2023, I consider myself
    something of a retired advisor to the project: I'm happy to help resolve
    disputes or provide mentorship and guidance, but have zero input on the day
    to day runnings of the project, and frankly almost certainly could not
    meaningfully contribute code to the current codebase without relearning it
    from scratch.

## Completed/Abandoned

- [`qmk_emote_macro_generator`](https://github.com/klardotsh/qmk_emote_macro_generator)
  (2018; Rust), a preprocessor of sorts to generate QMK mechanical keyboard
  firmware code to make the keyboard type out Unicode emojis. While the source
  code still builds (thanks, Rust 1.x guarantees!), I'm not sure if the code it
  generates still makes any sense against any QMK codebase of the 2020s.

- [git-staredown](https://github.com/klardotsh/git-staredown) (2017; Python), a
  utility to provide an analogue to `git blame` for GitHub pull requests,
  allowing associating a commit with the pull request it came from. This has
  long since bitrotten away from various library and API upgrades, and targeted
  a now-EOL Python version. Please don't use this.
