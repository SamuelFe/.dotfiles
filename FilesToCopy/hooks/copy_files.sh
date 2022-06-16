#!/bin/sh

[ -f /usr/share/libalpm/hooks/bash-update.hook ] && sudo rm /usr/share/libalpm/hooks/bash-update.hook

sudo cp ./* /usr/share/libalpm/hooks/
