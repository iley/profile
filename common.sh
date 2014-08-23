export GPGKEY=DCC2E057
export EDITOR=vim
export PAGER=less
export LESS="-iMSx4 -FXR"
export PATH=$PATH:~/bin
export DEBEMAIL="iley@iley.ru"
export DEBFULLNAME="Ilya Strukov"
export GDK_USE_XFT=1
export QT_XFT=true
# required for proper XCompose work in GTK apps
export GTK_IM_MODULE=xim
export ANSIBLE_NOCOWS=1

if [ -e "/usr/local/heroku" ]; then
    export PATH="/usr/local/heroku/bin:$PATH"
fi

if [ -e "$HOME/.local/bin" ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

if [ -e "$HOME/.npm-packages/bin" ]; then
    export PATH=$PATH:$HOME/.npm-packages/bin
fi

PROFILE=$HOME/profile
EXT=$PROFILE/ext

# common aliases for all shells
source $PROFILE/alias.sh

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

if [ -d ~/code/go ]; then
    export GOPATH="$HOME/code/go"
else
    export GOPATH="$HOME/go"
fi

function say() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }

source $PROFILE/login.sh
# load machine-specific setting at the very end
source $PROFILE/local.sh
