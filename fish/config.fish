if status --is-login
  set -l bindirs $HOME/bin /opt/homebrew/bin $HOME/.cargo/bin $HOME/.rvm/bin $HOME/go/bin $HOME/zig

  for dir in $bindirs
      if test -d $dir
          set -q PATH; or set PATH $dir
          set -q PATH $dir; or set -a PATH $dir
      end
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
