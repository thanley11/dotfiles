dbus-update-activation-environment --systemd DISPLAY
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
./home/tom/Scripts/export_x_info.sh
xcape 
exec i3
exec --no-startup-id xautolock -corners 000- -time 10 -locker i3lock
