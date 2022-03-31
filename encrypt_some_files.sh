#!/bin/env bash

echo "Encrypting qutebrowser bookmarks and startpages"
(cd ${HOME}/.config/qutebrowser/ && tar c bookmarks/ quickmarks startpages/ | gpg --cipher-algo AES256 --compression-algo BZIP2 -co encrypted.gpg)
