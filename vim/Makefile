CACHE_PATH=$(HOME)/.local/share/vim/
CACHE_DIRS=$(addprefix $(CACHE_PATH),swap backup undo)

.PHONY: all links vundle

all: links vundle $(CACHE_DIRS)

links: $(HOME)/.vim $(HOME)/.vimrc

$(HOME)/.vim: .
	ln -sf $(abspath $<) $@

$(HOME)/.vimrc: vimrc
	ln -sf $(abspath $<) $@

vundle:
	vim -c ':BundleInstall' -c ':qall'

$(CACHE_DIRS): %:
	mkdir -p $@
