#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
get_w(){ if [ "$(pwd)/" = "$HOME" ];then W='~';else W=$(echo $(pwd)|sed 's@'"$HOME"'@~/@');fi;if [ $(echo $W|grep -o '/'|wc -l) -gt 5 ];then echo $W|cut -d'/' -f1-5|xargs -I{} echo {}"/../${W##*/}";else echo $W;fi }
setps1(){ PS1="\[$(tput bold)\]$(tput setaf 6)\][\[$(tput setaf 3)\]\u\[$(tput setaf 6)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 1)\]"$(get_w)"\[$(tput setaf 6)\]]\[$(tput bold)\]\[$(tput setaf 7)\] \\$ \[$(tput sgr0)\]"; }
PROMPT_COMMAND=setps1

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# register bash aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# set history options
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# ssh-agent setup
if ! pgrep -u "$USER" ssh-agent > /dev/null; then ssh-agent | head -n-1 > ~/.ssh-agent-instance; fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then eval "$(<~/.ssh-agent-instance)"; fi

# For some reason github doesn't auto add
ssh-add -q ~/.ssh/github
