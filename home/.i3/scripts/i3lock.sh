#!/bin/sh
base03bg='#002B36'
base03='#002B36ff'
base02='#073642ff'
base01='#586E75ff'
base00='#657B83ff'
base0='#839496ff'
base1='#93A1A1ff'
base2='EEE8D5ff'
base3='#FDF6E3ff'
yellow='#B58900ff'
orange='#CB4B16ff'
red='#DC322Fff'
magenta='#D33682ff'
violet='#6C71C4ff'
blue='#268BD2ff'
cyan='#2AA198ff'
green='#859900ff'

i3lock \
--insidevercolor=$base03    \
--ringvercolor=$green       \
\
--insidewrongcolor=$base03  \
--ringwrongcolor=$orange    \
\
--insidecolor=$base03       \
--ringcolor=$blue           \
--linecolor=$base02         \
--separatorcolor=$base03    \
\
--verifcolor=$green         \
--wrongcolor=$orange        \
--timecolor=$base0          \
--datecolor=$base0          \
--layoutcolor=$base0        \
--keyhlcolor=$cyan          \
--bshlcolor=$orange         \
\
--screen 0                  \
--color=$base03bg           \
--clock                     \
--indicator                 \
--timestr="%I:%M %p"        \
--datestr="%m/%d/%Y"        \
