# Uncomment for profiling
# zmodload zsh/zprof

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=~/profile/zsh_custom
ZSH_THEME="iley"

plugins=(ssh-agent docker golang kubectl fasd helm aws fzf nvm)
if [[ $(uname -s) != 'Darwin' ]]; then
  plugins+=(bgnotify)
fi

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_ed25519

fpath=(~/.zsh/completion $fpath)

DEFAULT_USER=iley
DISABLE_AUTO_UPDATE=true

source $ZSH/oh-my-zsh.sh

setopt hist_ignore_dups share_history inc_append_history extended_history no_beep
unsetopt autopushd autonamedirs correct_all

export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory

source $HOME/profile/common.sh

# Edit command-line with ctrl-x e
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

compdef _bazel bazel bzl
if command -v kubectl 2>&1 >/dev/null; then
    compdef k=kubectl
fi
setopt complete_aliases

# export FZF_TMUX=1
export FZF_DEFAULT_COMMAND="ag -l --nocolor"
export FZF_CTRL_T_COMMAND="ag -l --nocolor"

unalias '...'

source ~/profile/helpers.sh
