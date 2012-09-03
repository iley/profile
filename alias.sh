alias ls='ls --color=auto'
alias open='xdg-open'

alias e='vim'
alias xc='xclip -i -selection clipboard'
alias xp='xclip -o -selection clipboard'

alias py='ack-grep --python'

get_git_branch() {
    echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
}

# git aliases
alias gst='git status'
alias gpull='git pull origin `get_git_branch`'
alias gpush='git push origin `get_git_branch`'
alias gdiff='git diff'
alias gcommit='git commit'
alias gadd='git add'
alias glog='git log'
alias gfetch='git fetch'

# even shorter git aliases
alias g=git
alias gc='git commit'
alias ga='git add'

alias ncal='ncal -M'
