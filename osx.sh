function notify-send {
  if [[ -z "$1" ]]; then
    echo "Usage: notify-send MESSAGE" >&2
    return
  fi
  osascript -e "display notification \"$1\" with title \"Notification\""
}

export HOMEBREW_NO_ANALYTICS=1
