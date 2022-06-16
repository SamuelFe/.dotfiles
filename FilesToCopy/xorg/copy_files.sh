#!/bin/sh


[ -f /etc/X11/xorg.conf.d/30-touchpad.conf ] && sudo rm /etc/X11/xorg.conf.d/30-touchpad.conf

sudo cp ./* /etc/X11/xorg.conf.d/
