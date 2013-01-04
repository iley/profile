export EDITOR="vim"
export PAGER=less
export LESS="-iMSx4 -FXR"
export PATH=$PATH:~/bin:$EXT/gitflow:$EXT/willgit/bin

if [ -e ~/.local/bin ]; then
    export PATH=$PATH:~/.local/bin
fi

export GDK_USE_XFT=1
export QT_XFT=true

PROFILE=$HOME/profile
EXT=$PROFILE/ext

# common aliases for all shells
source $PROFILE/alias.sh

# required for proper XCompose work in GTK apps
export GTK_IM_MODULE=xim

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
