
_ssh_auth_save() {
	ln -sf "$SSH_AUTH_SOCK" "$HOME/.screen/ssh-auth-sock.$HOSTNAME"
}

alias screen='_ssh_auth_save ; export HOSTNAME=$(hostname) ; screen'
alias ls='ls --color=auto'
alias open='xdg-open'

alias e='emacsclient'
#alias vi='emacsclient'
#alias vim='emacsclient'
