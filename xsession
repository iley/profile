xset -b
setxkbmap -layout "us,ru"
setxkbmap -option "" -option "grp:alt_shift_toggle,grp_led:scroll,compose:ralt,terminate:ctrl_alt_bksp"

if command -v feh >/dev/null 2>&1 && [ -e ~/wallpaper.jpg ] ; then
   feh --bg-scale ~/wallpaper.jpg
fi

geni3config /tmp/i3.conf
exec /usr/bin/i3 -c /tmp/i3.conf >> /tmp/i3.log 2>&1

#vim: setf sh:
