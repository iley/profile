PROFILE=$HOME/profile

export EDITOR=vim
export PAGER=less
export LESS="-iMSx4 -FXR"
export PATH=$PATH:~/bin
# required for proper XCompose work in GTK apps
export GTK_IM_MODULE=xim
export ANSIBLE_NOCOWS=1
export GO15VENDOREXPERIMENT=1

if [[ -e "$HOME/.local/bin" ]]; then
    export PATH=$PATH:$HOME/.local/bin
fi

if [[ -e "$HOME/.npm-packages/bin" ]]; then
    export PATH=$PATH:$HOME/.npm-packages/bin
fi

# set $TERM to make tmux work properly
if [[ "$TERM" != 'screen-256color' ]]; then
    export TERM=xterm-256color
fi

if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"
    export PATH="$PATH:$HOME/go/bin"
fi

# use meld for g4 diff
if [ -n "$DISPLAY" ] ; then export G4MULTIDIFF=1 ; fi
export P4DIFF='bash -c "meld \${@/#:/--diff}" padding-to-occupy-argv0'

source "$PROFILE/helpers.sh"
source "$PROFILE/alias.sh"
source "$PROFILE/login.sh"
if [[ $(uname -s) = 'Darwin' ]]; then
  source "$PROFILE/osx.sh"
fi
# load machine-specific setting at the very end
source "$PROFILE/local.sh"
