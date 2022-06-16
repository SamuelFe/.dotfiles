[ -f ~/.bashrc ] &&  . ~/.bashrc

# if running bash
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# includes personal scripts into PATH
[ -d "$HOME/.scripts" ] && export PATH="$PATH:$HOME/.scripts"
