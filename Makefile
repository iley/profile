SRC=bashrc gitconfig i3 i3status.conf inputrc mplayer oh-my-zsh \
	perldb perltidyrc racketrc sbclrc screen screenrc ssh/config tmux.conf \
	zshrc psqlrc Xdefaults zsh config/redshift.conf rss2email config/twmn.conf \
	atoolrc
DST=$(addprefix $(HOME)/.,$(SRC))
DIRS=$(HOME)/.config $(HOME)/.ssh

.PHONY: all links submodule

all: links submodule vim

links: $(DIRS) $(DST) $(HOME)/bin

$(DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

$(HOME)/bin: bin
	ln -sf $(abspath $<) $@

$(DIRS): %:
	mkdir -p $@

vim:
	git clone iley@iley.ru:git/vimrc vim
	make -C vim

submodule:
	git submodule update --init --recursive
