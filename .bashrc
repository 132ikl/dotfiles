#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
get_w(){ if [ "$(pwd)" = "$(readlink -f $HOME)" ] || [ "$(pwd)" = "$(readlink -f $HOME)/" ];then W='~';else W=$(echo $(pwd)|sed 's@'"$(readlink -f $HOME)"'@~@');fi;if [ $(echo $W|grep -o '/'|wc -l) -gt 5 ];then echo $W|cut -d'/' -f1-5|xargs -I{} echo {}"/../${W##*/}";else echo $W;fi }
git_status(){ branch="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"; if [ ! -z "$branch" ]; then echo " $(git_color)($branch)$(tput rmso)"; fi; }
git_color(){ color="$(tput setaf 6)"; git diff-index --quiet HEAD 2>&- || color="$(tput setaf 3)"; git status 2>&- | grep -q behind && color="$(tput smso)$color"; echo "$color"; }
setps1(){ PS1="\[$(tput bold)\]\[$(tput setaf 6)\][\[$(tput setaf 3)\]\u\[$(tput setaf 69)\]@\[$(tput setaf ${HOST_COLOR:-4})\]\h \[$(tput setaf 1)\]"$(get_w)"\[$(tput setaf 6)\]]\[$(tput bold)\]\$(git_status)\[$(tput setaf 7)\] \\$ \[$(tput sgr0)\]"; }
PROMPT_COMMAND=setps1
# vi
set -o vi

# fzf
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash 
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash 

# register bash aliases
[ -f "$(readlink -f $HOME)/.config/aliasrc" ] && source "$(readlink -f $HOME)/.config/aliasrc"

# set history options
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
HISTSIZE=-1
HISTFILESIZE=-1

LESSHISTFILE="~/.local/share/.lesshist"

# ssh-agent setup
if ! pgrep -u "$USER" ssh-agent > /dev/null; then ssh-agent | head -n-1 > ~/.ssh-agent-instance; fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then eval "$(<~/.ssh-agent-instance)"; fi

# For some reason github doesn't auto add
ssh-add -q ~/.ssh/github
ssh-add -q ~/.ssh/gitlab
