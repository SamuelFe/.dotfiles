# 
# ░██████╗░█████╗░███████╗███████╗  Samuel Fernandes
# ██╔════╝██╔══██╗██╔════╝██╔════╝  https://github.com/SamuelFe
# ╚█████╗░███████║█████╗░░█████╗░░
# ░╚═══██╗██╔══██║██╔══╝░░██╔══╝░░
# ██████╔╝██║░░██║██║░░░░░███████╗
# ╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚══════╝  🆃🅷🅸🆂 🅸🆂 🅼🆈 🅿🆁🅾🅵🅸🅻🅴 🅲🅾🅽🅵🅸🅶.
#

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# includes the dmenu scripts into PATH
if [ -d "$HOME/.dmenu_scripts/scripts" ] ; then # [ -d "path/to/dir" ] means "if directory exists"
    export PATH="$PATH:$HOME/.dmenu_scripts/scripts"
fi

export XDG_CONFIG_HOME="$HOME/.config"
export QT_QPA_PLATFORMTHEME=qt5ct
