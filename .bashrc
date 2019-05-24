#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# register bash aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# ssh-agent setup
if ! pgrep -u "$USER" ssh-agent > /dev/null; then ssh-agent | head -n-1 > ~/.ssh-agent-instance; fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then eval "$(<~/.ssh-agent-instance)"; fi
