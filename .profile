#
# ~/.profile
#

# Add ~/.scripts to $PATH
export PATH=$PATH:~/.scripts/

# Set profile variables
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"

# Run .bashrc if exists and shell is bash
echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 is not running in tty1
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx
