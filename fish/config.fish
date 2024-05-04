if status --is-login
  set -gx PATH $PATH ~/bin
  if test -d /opt/homebrew/bin
    set -gx PATH $PATH /opt/homebrew/bin
  end

  if test -d $HOME/.cargo/bin
    set -gx PATH $PATH $HOME/.cargo/bin
  end

  if test -d $HOME/.rvm/bin
    set -gx PATH $HOME/.rvm/bin $PATH
  end

  set -gx EDITOR nvim
end

if status is-interactive
  [ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish
end

set -g fish_greeting ''

source ~/.local.fish

if test -d ~/.opam
  source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end

[ -f /usr/share/autojump/autojump.fish ]; and source /usr/share/autojump/autojump.fish

if type -q rvm
  rvm default
end
