export EDITOR="vim"
export PAGER=less
export PROFILE=$HOME/profile
CONTRIB=$PROFILE/contrib
export PATH=$PATH:~/bin:$CONTRIB/gitflow:$CONTRIB/map
export TERM=xterm-256color # for emacs

# utilify for statadhoc tasks
source $PROFILE/task.sh

# common aliases for all shells
source $PROFILE/alias.sh

# statadhoc tools
if [ -e ~/statbox ]; then
	SCTL_COMPLETION=On . ~/statbox/bashrc-devel ~/statbox 
fi

# perlbrew
if [ -e ~/perl5 ]; then
	source ~/perl5/perlbrew/etc/bashrc
fi

# ruby rvm
RVM_HOME=/usr/share/ruby-rvm
[[ -s $RVM_HOME/scripts/rvm ]] && source $RVM_HOME/scripts/rvm

# python virtualenvwrapper
VENVW="/usr/local/bin/virtualenvwrapper.sh"
if [ -e $VENVW ]; then
	export WORKON_HOME="~/.virtualenvs"
	source $VENVW
fi

# load machine-specific setting at the very end
source $PROFILE/local.sh
