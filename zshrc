# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
export DEFAULT_USER=iley

fpath=(~/.zsh/completion $fpath)

plugins=(pip screen virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

setopt hist_ignore_dups share_history inc_append_history extended_history no_beep
unsetopt autopushd
export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory

unalias sl
unsetopt correct_all

function _rollback() { }

function chpwd; {
    _rollback
    function _rollback() { }
    DIRECTORY="$PWD"
    while true; do
        if [ -f './.env.rc' ]; then
            source './.env.rc'
            break
        fi
        [ $PWD = '/' ] && break
        cd -q ..
    done
    cd -q "$DIRECTORY"
    unset DIRECTORY
}

function local_alias() {
    alias $1=$2
    eval "function _rollback() { unalias $1 }"
}

source $HOME/profile/common.sh
source $HOME/profile/zsh_alias.sh
