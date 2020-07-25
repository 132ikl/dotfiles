#
# ~/.profile
#

source ~/.config/local_profile

# $PATH additions
export PATH=~/.scripts/:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.local/bin/fakehomes:$PATH
export PATH=~/.emacs/bin:$PATH
export CDPATH=$CDPATH:~/Projects/
export CDPATH=$CDPATH:~/Programs/

# config config
export XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share

export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/startup.py

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export STEAM_COMPAT_DATA_PATH="$XDG_DATA_HOME"/Steam/steamapps/compatdata

# Set profile variables
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox-developer-edition"

# Misc.
complete -d cd

# Run .bashrc if exists and shell is bash
echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 is not running in tty1
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && [[ ! -e NO_STARTX ]] && exec startx
