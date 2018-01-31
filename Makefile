SRC=bashrc gitignore_global ssh/config ssh/rc tmux.conf zshrc zsh \
	config/flake8 config/pep8 config/dunst npmrc XCompose ansible.cfg \
	ansible.hosts muttrc Xdefaults i3status.conf gitconfig_global \
	gdbinit
DST=$(addprefix $(HOME)/.,$(SRC))
DIRS=$(HOME)/.config $(HOME)/.ssh
OHMYZSH=~/.oh-my-zsh

.PHONY: all links vimstuff

all: links vimstuff ~/.gitconfig

links: $(DIRS) $(DST) $(OHMYZSH)

$(OHMYZSH):
	git clone https://github.com/robbyrussell/oh-my-zsh.git $@

$(DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

$(DIRS): %:
	mkdir -p $@

~/.gitconfig:
	cp gitconfig_template ~/.gitconfig

vimstuff:
	make -C vim
