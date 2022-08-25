# Uncomment for profiling
# zmodload zsh/zprof

source $HOME/profile/common.sh
source $HOME/.bash_profile

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=~/profile/zsh_custom
# ZSH_THEME="iley"
ZSH_THEME="" # Disabled for pure.

plugins=(ssh-agent docker kubectl autojump nvm asdf fzf)

zstyle :omz:plugins:ssh-agent agent-forwarding on

fpath=(~/.zsh/completion $fpath)

DISABLE_AUTO_UPDATE=true
# DISABLE_UNTRACKED_FILES_DIRTY=true

source $ZSH/oh-my-zsh.sh

# pure shell prompt (https://github.com/sindresorhus/pure)
fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

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

compdef _git stripe-git=git

source $HOME/profile/alias.sh
source $HOME/profile/helpers.sh
