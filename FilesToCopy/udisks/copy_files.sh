#!/bin/sh

[ -f /etc/udisks2/mount_options.conf ] && sudo rm /etc/udisks2/mount_options.conf 

sudo cp ./* /etc/udisks2/
