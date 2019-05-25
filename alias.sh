if [[ $(uname -s) = 'Linux' ]]; then
    alias ls='ls --color=auto'
    alias open='xdg-open'
elif [[ $(uname -s) = 'Darwin' ]]; then
    alias ls='ls -G'
fi

if command -v ack-grep >/dev/null 2>&1; then
    alias ack='ack-grep'
fi

alias vi='vim'

alias xc='xclip -i -selection clipboard'
alias xp='xclip -o -selection clipboard'

alias stmux='tmux attach -d -t default || tmux new'

alias hi='helmfile --interactive'
