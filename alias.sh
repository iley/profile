if ls / --color=auto >/dev/null 2>/dev/null; then
    # coreutils ls (Linux and MacOS with coreutils installed)
    alias ls='ls --color=auto'
else
    # BSD (plain MacOS)
    alias ls='ls -G'
fi

if command -v ack-grep >/dev/null 2>&1; then
    alias ack='ack-grep'
fi

alias vi='vim'
alias e='vim'

alias xc='xclip -i -selection clipboard'
alias xp='xclip -o -selection clipboard'

alias stmux='tmux attach -d -t default || tmux new'

alias hi='helmfile --interactive'

alias cwatch='watch --color -n1'

alias tf=terraform
alias tfa='terraform apply'
alias tfp='terraform plan'
alias tfi='terraform init'
