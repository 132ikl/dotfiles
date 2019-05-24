#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"


# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/steven/.cache/yay/electron-forge/src/electron-forge-5.2.4/node_modules/tabtab/.completions/electron-forge.bash ] && . /home/steven/.cache/yay/electron-forge/src/electron-forge-5.2.4/node_modules/tabtab/.completions/electron-forge.bash