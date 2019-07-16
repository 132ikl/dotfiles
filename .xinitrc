# Start simple X hotkey daemon
sxhkd &

# Set mouse accel
xinput set-prop pointer:"Logitech G300s Optical Gaming Mouse" "libinput Accel Speed" -0.7

# Swap caps lock and escape and compose key
setxkbmap -option "caps:swapescape"
setxkbmap -option "compose:menu"

# Start compositor
compton -b

# Dunst fix
systemctl --user import-environment DISPLAY

# Initalize Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start i3
exec i3
