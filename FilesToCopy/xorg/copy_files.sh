#!/bin/env bash


if [ -f /etc/X11/xorg.conf.d/30-touchpad.conf ]; then
   sudo rm /etc/X11/xorg.conf.d/30-touchpad.conf
fi

sudo cp ./* /etc/X11/xorg.conf.d/
