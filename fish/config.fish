if status --is-login
  set -gx PATH $PATH ~/bin /opt/homebrew/bin
  set -gx EDITOR nvim
end

if status is-interactive
  [ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish
end

set -g fish_greeting ''
