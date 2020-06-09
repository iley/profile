.PHONY: all links vundle

all: links plugins

links: $(HOME)/.vim $(HOME)/.vimrc

$(HOME)/.vim: .
	ln -sf $(abspath $<) $@

$(HOME)/.vimrc: vimrc
	ln -sf $(abspath $<) $@

plugins:
	vim -c ':PlugInstall' -c ':qall'
