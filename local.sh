hostname="$(hostname | perl -pe 's/^([^\.]+)\..*$/$1/')"
localrc="$PROFILE/local/$hostname"
if [ -e "$localrc" ]; then
    source "$localrc"
fi
if [ -e "$localrc.secret" ]; then
    source "$localrc.secret"
fi
