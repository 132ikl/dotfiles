# Start simple X hotkey daemon
sxhkd &

# Set mouse accel
xinput set-prop pointer:"Logitech G300s Optical Gaming Mouse" "libinput Accel Speed" -0.7

# Swap caps lock and escape
setxkbmap -option "caps:swapescape"

# Set compose key
setxkbmap -option "compose:menu"

# Start compositor
compton -b

# Setup monitors
~/.screenlayout/default.sh

# Dunst fix
systemctl --user import-environment DISPLAY

# Start i3
exec i3
