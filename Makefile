SRC=XCompose bashrc gitconfig i3 i3status.conf inputrc mplayer oh-my-zsh \
perldb perltidyrc racketrc sbclrc screen screenrc ssh/config taskrc tmux.conf \
vim vimrc xinitrc zshrc
DST=$(addprefix $(HOME)/.,$(SRC))
COMMANDT_DIR=vim/bundle/command-t/ruby/command-t/

.PHONY: default all links vundle commandt

all: links vundle commandt

links: $(DST) $(HOME)/bin

$(DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

$(HOME)/bin: bin
	ln -sf $(abspath $<) $@

vundle:
	vim -c ':BundleInstall' -c ':qall'

commandt:
	cd $(COMMANDT_DIR); \
		ruby extconf.rb
	make -C $(COMMANDT_DIR)

rvm:
	curl -L get.rvm.io | bash -s stable --ruby
