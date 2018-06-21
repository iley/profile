.PHONY: all links vundle

all: links plugins

links: $(HOME)/.vim $(HOME)/.vimrc

$(HOME)/.vim: .
	ln -sf $(abspath $<) $@

$(HOME)/.vimrc: vimrc
	ln -sf $(abspath $<) $@

bundle/Vundle.vim:
	git clone https://github.com/VundleVim/Vundle.vim.git bundle/Vundle.vim

plugins: bundle/Vundle.vim
	vim -c ':PlugInstall' -c ':qall'
