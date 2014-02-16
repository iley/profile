alias ls='ls --color=auto'
alias open='xdg-open'

alias xc='xclip -i -selection clipboard'
alias xp='xclip -o -selection clipboard'

alias py='ack-grep --python'
alias ack='ack-grep'

alias ncal='ncal -M'

alias bell='echo -en "\a"'

# git
alias g='git'
alias gc='git commit'
alias gcm='git commit -m'
alias gst='git status -sb'

# pseudo-aliases
function lt() { ls -ltrsa "$@" | tail; }
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
