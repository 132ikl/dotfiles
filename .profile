#
# ~/.profile
#

source ~/.config/local_profile

# $PATH additions
export PATH=$PATH:~/.scripts/
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.emacs/bin

# Set profile variables
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox-developer-edition"

# Misc.
complete -d cd

# Run .bashrc if exists and shell is bash
echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 is not running in tty1
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && [[ ! -e .suspend-xsession ]] && exec startx
