xset -b
setxkbmap -option terminate:ctrl_alt_bksp

geni3config /tmp/i3.conf
exec /usr/bin/i3 -c /tmp/i3.conf >> /tmp/i3.log 2>&1

#vim: setf sh:
