# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="gentoo"

plugins=(cpanm debian perl pip screen ssh-agent taskwarrior virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

setopt hist_ignore_dups share_history inc_append_history extended_history

# fasd
if [ $commands[fasd] ]; then # check if fasd is installed
  eval "$(fasd --init auto)"
  alias v='f -t -e vim -b viminfo'
  alias o='a -e xdg-open'
fi

bindkey '^X^A' fasd-complete    # C-x C-a to do fasd-complete (fils and directories)
bindkey '^X^F' fasd-complete-f  # C-x C-f to do fasd-complete-f (only files)
bindkey '^X^D' fasd-complete-d  # C-x C-d to do fasd-complete-d (only directories)

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
source $HOME/profile/zsh_alias.sh
