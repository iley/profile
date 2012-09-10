SRC=XCompose bashrc gitconfig i3 i3status.conf inputrc mplayer oh-my-zsh \
perldb perltidyrc racketrc sbclrc screen screenrc ssh/config taskrc tmux.conf \
xinitrc zshrc
DST=$(addprefix $(HOME)/.,$(SRC))

.PHONY: all links rvm vim submodule

all: links submodule vim

links: $(DST) $(HOME)/bin

$(DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

$(HOME)/bin: bin
	ln -sf $(abspath $<) $@

rvm:
	curl -L get.rvm.io | bash -s stable --ruby

vim: submodule
	make -C vim

submodule:
	git submodule update --init --recursive
