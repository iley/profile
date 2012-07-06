# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gentoo"

plugins=(cpanm debian git perl screen pip)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

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
		if [ -f './env' ]; then
			source './env'
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
