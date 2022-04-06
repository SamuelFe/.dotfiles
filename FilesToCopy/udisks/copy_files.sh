#!/bin/env bash

if [ -f /etc/udisks2/mount_options.conf ]; then
   sudo rm /etc/udisks2/mount_options.conf 
fi

sudo cp ./* /etc/udisks2/
