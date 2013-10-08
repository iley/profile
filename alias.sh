alias ls='ls --color=auto'
alias open='xdg-open'

alias xc='xclip -i -selection clipboard'
alias xp='xclip -o -selection clipboard'

alias py='ack-grep --python'
alias ack='ack-grep'

alias ncal='ncal -M'

alias bell='echo -en "\a"'

get_git_branch() {
    echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
}

alias e=emacsclient
alias en='emacsclient -n'
alias vim=vimstub

# pseudo-aliases
function lt() { ls -ltrsa "$@" | tail; }
function psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
function fname() { find . -iname "*$@*"; }
