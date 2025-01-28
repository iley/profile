# Uncomment for profiling
# zmodload zsh/zprof

source $HOME/profile/common.sh
if [[ -e $HOME/.bash_profile ]]; then
  source $HOME/.bash_profile
fi

ZSH=$HOME/.oh-my-zsh
ZSH_CUSTOM=~/profile/zsh_custom

if [[ "$(uname)" == "Darwin" ]]; then
  # On MacOS Pure is used.
  ZSH_THEME=""
else
  ZSH_THEME="iley"
fi

plugins=(ssh-agent docker kubectl autojump nvm asdf fzf sdk)

zstyle :omz:plugins:ssh-agent agent-forwarding on

fpath=(~/.zsh/completion $fpath)

DISABLE_AUTO_UPDATE=true
# DISABLE_UNTRACKED_FILES_DIRTY=true

source $ZSH/oh-my-zsh.sh

if [[ "$(uname)" == "Darwin" ]]; then
  # pure shell prompt (https://github.com/sindresorhus/pure)
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
  autoload -U promptinit; promptinit
  prompt pure
fi

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
