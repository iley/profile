SRC=bashrc gitconfig gitignore_global ssh/config ssh/rc tmux.conf zshrc zsh \
	config/flake8 config/pep8 npmrc XCompose ansible.cfg ansible.hosts
DST=$(addprefix $(HOME)/.,$(SRC))
DIRS=$(HOME)/.config $(HOME)/.ssh
OHMYZSH=~/.oh-my-zsh

.PHONY: all links

all: links vimstuff

links: $(DIRS) $(DST) $(OHMYZSH)

$(OHMYZSH):
	git clone git://github.com/robbyrussell/oh-my-zsh.git $@

$(DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

$(DIRS): %:
	mkdir -p $@

vimstuff:
	make -C vim
