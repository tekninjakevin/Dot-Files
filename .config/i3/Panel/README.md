# bumblebee-status

[![Build Status](https://travis-ci.org/tobi-wan-kenobi/bumblebee-status.svg?branch=master)](https://travis-ci.org/tobi-wan-kenobi/bumblebee-status)
[![Documentation Status](https://readthedocs.org/projects/bumblebee-status/badge/?version=master)](https://bumblebee-status.readthedocs.io/en/master/?badge=master)
![AUR version](https://img.shields.io/aur/version/bumblebee-status)
[![PyPI version](https://badge.fury.io/py/bumblebee-status.svg)](https://badge.fury.io/py/bumblebee-status)
[![Code Climate](https://codeclimate.com/github/tobi-wan-kenobi/bumblebee-status/badges/gpa.svg)](https://codeclimate.com/github/tobi-wan-kenobi/bumblebee-status)
[![Test Coverage](https://codeclimate.com/github/tobi-wan-kenobi/bumblebee-status/badges/coverage.svg)](https://codeclimate.com/github/tobi-wan-kenobi/bumblebee-status/coverage)
[![Issue Count](https://codeclimate.com/github/tobi-wan-kenobi/bumblebee-status/badges/issue_count.svg)](https://codeclimate.com/github/tobi-wan-kenobi/bumblebee-status)

**Many, many thanks to all contributors! I am still amazed by and deeply grateful for how many PRs this project gets.**

[Click here for a list of available modules](https://bumblebee-status.readthedocs.io/en/master/modules.html)

![Solarized Powerline](screenshots/themes/powerline-solarized.png)

bumblebee-status is a modular, theme-able status line generator for the [i3 window manager](https://i3wm.org/).

Focus is on:
* ease of use, sane defaults (no mandatory configuration file)
* [easy creation of custom themes](https://bumblebee-status.readthedocs.io/en/master/development/theme.html)
* [easy creation of custom modules](https://bumblebee-status.readthedocs.io/en/master/development/module.html)

I hope you like it and I appreciate any kind of feedback: bug reports, feature requests, etc. :)

Thanks a lot!

Required i3wm version: 4.12+ (in earlier versions, blocks won't have background colors)

Supported Python versions: 3.4, 3.5, 3.6, 3.7, 3.8

Supported FontAwesome version: 4 (free version of 5 doesn't include some of the icons)

---
**NOTE**

I am planning to rename `master` to `main` - the branch already exists, and I will eventually change the **default** branch to `main`. Just be advised :)

If you are curious why: [ZDNet:github-master-alternative](https://www.zdnet.com/article/github-to-replace-master-with-alternative-term-to-avoid-slavery-references/)

---

Example usage:

```
bar {
	status_command <path>/bumblebee-status -m cpu memory battery time \
		pasink pasource -p time.format="%H:%M" -t solarized
}
```

# Documentation
See [the docs](https://bumblebee-status.readthedocs.io) for detailed documentation.

See [FAQ](https://bumblebee-status.readthedocs.io/en/master/FAQ.html) for. well, FAQs.

Other resources:

* A list of [available modules](https://bumblebee-status.readthedocs.io/en/master/modules.html)
* [How to write a module](https://bumblebee-status.readthedocs.io/en/master/development/module.html)
* [How to write a theme](https://bumblebee-status.readthedocs.io/en/master/development/theme.html)

# Installation
```
# from git (development snapshot)
$ git clone git://github.com/tobi-wan-kenobi/bumblebee-status

# from AUR:
git clone https://aur.archlinux.org/bumblebee-status.git
cd bumblebee-status
makepkg -sicr

# from PyPI (thanks @tony):
# will install bumblebee-status into ~/.local/bin/bumblebee-status
pip install --user bumblebee-status
```

# Dependencies
[Available modules](https://bumblebee-status.readthedocs.io/en/master/modules.html) lists the dependencies (Python modules and external executables)
for each module. If you are not using a module, you don't need the dependencies.

# Usage
## Normal usage
In your i3wm configuration, modify the *status_command* for your i3bar like this:

```bash
bar {
	status_command <path to bumblebee-status/bumblebee-status> \
		-m <list of modules> \
		-p <list of module parameters> \
		-t <theme>
}
```

You can retrieve a list of modules (and their parameters) and themes by entering:
```bash
$ cd bumblebee-status
$ ./bumblebee-status -l themes
$ ./bumblebee-status -l modules
```

To change the update interval, use:
```bash
$ ./bumblebee-status -m <list of modules> -p interval=<interval in seconds>
```

The update interval can also be changed on a per-module basis, like this:
```bash
$ ./bumblebee-status -m cpu memory -p cpu.interval=5s memory.interval=1m
```

All modules can be given "aliases" using `<module name>:<alias>`, by which they can be parametrized, for example:

```bash
$ ./bumblebee-status -m disk:root disk:home -p root.path=/ home.path=/home
```

As a simple example, this is what my i3 configuration looks like:

```bash
bar {
	font pango:Inconsolata 10
	position top
	tray_output none
	status_command ~/.i3/bumblebee-status/bumblebee-status -m nic disk:root cpu \
		memory battery date time pasink pasource dnf \
		-p root.path=/ time.format="%H:%M CW %V" date.format="%a, %b %d %Y" \
		-t solarized-powerline
}

```

Restart i3wm and - that's it!

# User contributions

[@somospocos:bumblebee-status-contrib](https://github.com/somospocos/bumblebee-status-contrib): Collected resources and useful tricks by @somospocos

[@somospocos:bumblebee-bridge-dwm](https://github.com/somospocos/bumblebee-bridge-dwm): Bridge bumblebee-status output into dwm status bar

[@somospocos:bumblebee-bridge-dzen2](https://github.com/somospocos/bumblebee-bridge-dzen2): Bridge bumblebee-status output into dzen2

# Examples

[List of themes](https://bumblebee-status.readthedocs.io/en/master/themes.html)