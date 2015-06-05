LOCALRC="$PROFILE/local/$(hostname)"
if [ -e "$LOCALRC" ]; then
    source "$LOCALRC"
fi
if [ -e "$LOCALRC.secret" ]; then
    source "$LOCALRC.secret"
fi
