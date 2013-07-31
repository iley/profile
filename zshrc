# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=~/profile/zsh_custom
ZSH_THEME="iley"
plugins=(vagrant virtualenvwrapper nosetests ssh-agent)

zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa id_vagrant

fpath=(~/.zsh/completion $fpath)

DEFAULT_USER=iley
DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

setopt hist_ignore_dups share_history inc_append_history extended_history no_beep
unsetopt autopushd autonamedirs correct_all
unalias sl

export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory

source $HOME/profile/zsh_alias.sh
source $HOME/profile/common.sh
