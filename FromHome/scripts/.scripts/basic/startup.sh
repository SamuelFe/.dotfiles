#!/bin/sh

xwallpaper --zoom "$(<$HOME/.cache/wall)"
wal -R -s -n &
sxhkd & # hotkeys daemon
flameshot & # screenshots
setxkbmap -model abnt2 -layout br -variant abnt2 & # fixes my keyboard layout
load_polybar &
picom --experimental-backends &
pkill dunst; sudo dunst & # notifications
xss-lock --transfer-sleep-lock -- i3lock --nofork & # lock
nm-applet & # for NetworkManager
conky & # widget
