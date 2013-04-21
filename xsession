xset -b
setxkbmap -option terminate:ctrl_alt_bksp

unset LC_ALL
export LANG=ru_RU.UTF-8
exrpot LC_MESSAGES=C

LOCAL_CONFIG=~/.i3/`hostname`.config
cp ~/.i3/config /tmp/i3.config
if [ -e "$LOCAL_CONFIG" ]; then
    cat "$LOCAL_CONFIG" >> /tmp/i3.config
fi
cat ~/.i3/autostart.config >> /tmp/i3.config

exec /usr/bin/i3 -c /tmp/i3.config >> ~/.i3/logfile 2>&1
