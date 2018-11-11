# Uncomment for profiling
# zmodload zsh/zprof

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=~/profile/zsh_custom
ZSH_THEME="iley"

plugins=(ssh-agent docker golang kubectl autojump helm aws taskwarrior)
if [[ $(uname -s) != 'Darwin' ]]; then
  plugins+=(bgnotify)
fi

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa

fpath=(~/.zsh/completion $fpath)

DEFAULT_USER=iley
DISABLE_AUTO_UPDATE=true

source $ZSH/oh-my-zsh.sh

setopt hist_ignore_dups share_history inc_append_history extended_history no_beep
unsetopt autopushd autonamedirs correct_all

export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory

source $HOME/profile/zsh_alias.sh
source $HOME/profile/common.sh

# Edit command-line with ctrl-x e
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# Completion.
compdef _bazel bazel bzl
setopt complete_aliases

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
