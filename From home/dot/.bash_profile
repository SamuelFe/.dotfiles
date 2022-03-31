# 
# ░██████╗░█████╗░███████╗███████╗  Samuel Fernandes
# ██╔════╝██╔══██╗██╔════╝██╔════╝  https://github.com/SamuelFe
# ╚█████╗░███████║█████╗░░█████╗░░
# ░╚═══██╗██╔══██║██╔══╝░░██╔══╝░░
# ██████╔╝██║░░██║██║░░░░░███████╗
# ╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚══════╝  🆃🅷🅸🆂 🅸🆂 🅼🆈 🅿🆁🅾🅵🅸🅻🅴 🅲🅾🅽🅵🅸🅶.
#

[[ -f ~/.bashrc ]] &&  . ~/.bashrc

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

# XDG VARIABLES
export XDG_CONFIG_HOME="$HOME/.config"

# NECESSARY FOR QT5CT
export QT_QPA_PLATFORMTHEME=qt5ct

[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1
