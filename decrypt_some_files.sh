#!/bin/env bash
(cd ~/.config/qutebrowser/ && gpg -d encrypted.gpg | tar x)
