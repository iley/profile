PROFILE=$HOME/profile

export EDITOR=vim
export PAGER=less
export LESS="-iMSx4 -FXR"
export ANSIBLE_NOCOWS=1
export PYSPARK_PYTHON=python3

for extra_path in "$HOME/bin" "$HOME/.local/bin" "$HOME/.npm-packages/bin" "$HOME/go/bin" "$HOME/.local/bin"; do
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

# load machine-specific settings
hostname="$(hostname | sed 's/\..*$//')"
localrc="$PROFILE/local/$hostname"
if [ -e "$localrc" ]; then
    source "$localrc"
fi
if [ -e "$localrc.secret" ]; then
    source "$localrc.secret"
fi

source "$PROFILE/alias.sh"
if [[ $(uname -s) = 'Darwin' ]]; then
  source "$PROFILE/osx.sh"
fi
