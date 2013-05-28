# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gentoo"
plugins=(cp virtualenvwrapper)

fpath=(~/.zsh/completion $fpath)

export DEFAULT_USER=iley
export DISABLE_AUTO_UPDATE="true"

source $ZSH/oh-my-zsh.sh

setopt hist_ignore_dups share_history inc_append_history extended_history no_beep
unsetopt autopushd autonamedirs correct_all
unalias sl

export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.zhistory

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
