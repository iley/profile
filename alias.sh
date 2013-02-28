alias ls='ls --color=auto'
alias open='xdg-open'

#alias e='vim'
alias xc='xclip -i -selection clipboard'
alias xp='xclip -o -selection clipboard'

alias py='ack-grep --python'
alias ack='ack-grep'

alias ncal='ncal -M'

alias bell='echo -en "\a"'

get_git_branch() {
    echo `git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
}

# git aliases
alias gst='git status -s'
alias gpull='git pull --rebase origin `get_git_branch`'
alias gpush='git push origin `get_git_branch`'
alias gdiff='git diff'
alias gcommit='git commit'
alias gadd='git add'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gfetch='git fetch'
alias gco='git checkout'
alias gfl='git log -u'
alias gg='git ls-files | grep -i'
