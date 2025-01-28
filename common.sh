# Settings that are common for zsh and bash.

# Load machine-specific settings.
if [ -e "$HOME/.localrc" ]; then
    source "$HOME/.localrc"
fi

export EDITOR=nvim
export PAGER=less
export LESS="-iMSx4 -FXR"
export ANSIBLE_NOCOWS=1
export HOMEBREW_NO_ANALYTICS=1

for extra_path in "$HOME/bin" "$HOME/.local/bin" "$HOME/.npm-packages/bin" "$HOME/go/bin" "$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/flutter/bin" "/opt/homebrew/bin"; do
    if [[ -e "$extra_path" ]]; then
        export PATH=$PATH:$extra_path
    fi
done

if [[ -d "$HOME/go" ]]; then
    export GOPATH="$HOME/go"
fi

# Set $TERM to make tmux work properly.
if [[ "$TERM" != 'screen-256color' ]]; then
    export TERM=xterm-256color
fi

export FZF_DEFAULT_COMMAND="ag -l --nocolor"
export FZF_CTRL_T_COMMAND="ag -l --nocolor"
