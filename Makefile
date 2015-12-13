SRC=bashrc gitconfig i3 i3status.conf inputrc mplayer \
	perldb perltidyrc racketrc sbclrc screen screenrc ssh/config tmux.conf \
	zshrc psqlrc Xdefaults zsh config/redshift.conf \
	atoolrc xsession config/dunst config/fish config/ranger hgrc \
	config/htop status.py emacs.d config/flake8 todo npmrc XCompose ansible.cfg \
	ansible.hosts
DST=$(addprefix $(HOME)/.,$(SRC))
DIRS=$(HOME)/.config $(HOME)/.ssh
OHMYZSH=~/.oh-my-zsh

.PHONY: all links submodules

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

submodules:
	git submodule update --init --recursive

vimstuff: submodules
	make -C vim
