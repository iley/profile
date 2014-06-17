#!/bin/sh
set +x +u
result=
lang_from=en
lang_to=ru
if ! command -v xclip >/dev/null 2>&1; then
    result="xclip not installed!"
else
    input=$(xclip -o)
    result=$(gawk -f ~/bin/translate.awk {en=ru} "$input")
fi
notify-send "Translation $lang_from -> $lang_to" "$result"
