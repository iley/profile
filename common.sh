PROFILE=$HOME/profile

export EDITOR=vim
export PAGER=less
export LESS="-iMSx4 -FXR"
export PATH=$PATH:~/bin
# required for proper XCompose work in GTK apps
export GTK_IM_MODULE=xim
export ANSIBLE_NOCOWS=1
export GO15VENDOREXPERIMENT=1
export PYSPARK_PYTHON=python3

for extra_path in "$HOME/.local/bin" "$HOME/.npm-packages/bin" "$HOME/go/bin" "$HOME/.local/bin"; do
    if [[ -e "$extra_path" ]]; then
        export PATH=$PATH:$extra_path
    fi
done

if [ -d "$HOME/go" ]; then
    export GOPATH="$HOME/go"
fi

# set $TERM to make tmux work properly
if [[ "$TERM" != 'screen-256color' ]]; then
    export TERM=xterm-256color
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

# load machine-specific settings
hostname="$(hostname | perl -pe 's/^([^\.]+)\..*$/$1/')"
localrc="$PROFILE/local/$hostname"
if [ -e "$localrc" ]; then
    source "$localrc"
fi
if [ -e "$localrc.secret" ]; then
    source "$localrc.secret"
fi
