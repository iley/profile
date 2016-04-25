SRC=bashrc gitconfig gitignore ssh/config ssh/rc tmux.conf zshrc zsh \
	config/htop config/flake8 config/pep8 npmrc XCompose ansible.cfg ansible.hosts
DST=$(addprefix $(HOME)/.,$(SRC))
DIRS=$(HOME)/.config $(HOME)/.ssh
OHMYZSH=~/.oh-my-zsh

.PHONY: all links

all: links vimstuff

links: $(DIRS) $(DST) $(OHMYZSH) $(HOME)/bin

$(OHMYZSH):
	git clone git://github.com/robbyrussell/oh-my-zsh.git $@

$(DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

$(HOME)/bin: bin
	ln -sf $(abspath $<) $@

$(DIRS): %:
	mkdir -p $@

vimstuff:
	make -C vim
