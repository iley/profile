_ssh_auth_save() {
	ln -sf "$SSH_AUTH_SOCK" "$HOME/.screen/ssh-auth-sock.$HOSTNAME"
}

alias ls='ls --color=auto'
alias open='xdg-open'

alias e='vim'
