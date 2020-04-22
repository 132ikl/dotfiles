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

# gnome keyring
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets)

# Initalize Xresources
xrdb -load ~/.Xresources

# set audio settings
~/.scripts/setup_pulse
pulsemixer --set-volume=75


# Start i3
exec i3
