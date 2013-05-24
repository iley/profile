SRC=bashrc gitconfig i3 i3status.conf inputrc mplayer \
	perldb perltidyrc racketrc sbclrc screen screenrc ssh/config tmux.conf \
	zshrc psqlrc Xdefaults zsh config/redshift.conf \
	atoolrc xsession config/dunst config/fish
DST=$(addprefix $(HOME)/.,$(SRC))
DIRS=$(HOME)/.config $(HOME)/.ssh
OHMYZSH=~/.oh-my-zsh

.PHONY: all links

all: links vim

links: $(DIRS) $(DST) $(OHMYZSH) $(HOME)/bin

$(OHMYZSH):
	git clone git://github.com/robbyrussell/oh-my-zsh.git $@

$(DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

$(HOME)/bin: bin
	ln -sf $(abspath $<) $@

$(DIRS): %:
	mkdir -p $@

vim:
	git clone iley@iley.ru:git/vimrc vim
	make -C vim
