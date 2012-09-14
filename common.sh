export EDITOR="vim"
export PAGER=less
export LESS="-iMSx4 -FXR"
export PROFILE=$HOME/profile
CONTRIB=$PROFILE/contrib
export PATH=$PATH:~/bin:$CONTRIB/gitflow:$CONTRIB/map:$CONTRIB/willgit/bin:$CONTRIB/fasd

# common aliases for all shells
source $PROFILE/alias.sh

# required for proper XCompose work in GTK apps
export GTK_IM_MODULE=xim

# statadhoc tools
if [ -e ~/statbox ]; then
	SCTL_COMPLETION=On . ~/statbox/bashrc-devel ~/statbox 
fi

# perlbrew
if [ -e ~/perl5 ]; then
	source ~/perl5/perlbrew/etc/bashrc
fi

# set $TERM to make tmux work properly
if [[ "$TERM" != 'screen-256color' ]]; then
	export TERM=xterm-256color
fi

if [ -e ~/.rvm/scripts ]; then
    source $HOME/.rvm/scripts/rvm
fi

# load machine-specific setting at the very end
source $PROFILE/local.sh
