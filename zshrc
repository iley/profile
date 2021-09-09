# Uncomment for profiling
# zmodload zsh/zprof

source $HOME/profile/common.sh

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=~/profile/zsh_custom
ZSH_THEME="iley"

plugins=(ssh-agent docker kubectl autojump nvm asdf)

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_ed25519

fpath=(~/.zsh/completion $fpath)

DISABLE_AUTO_UPDATE=true

source $ZSH/oh-my-zsh.sh

setopt hist_ignore_dups share_history inc_append_history extended_history no_beep
unsetopt autopushd autonamedirs correct_all

export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory

# Edit command-line with ctrl-x e
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

if command -v kubectl 2>&1 >/dev/null; then
    compdef k=kubectl
fi
setopt complete_aliases

source $HOME/profile/alias.sh
source $HOME/profile/helpers.sh
