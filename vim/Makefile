COMMANDT_DIR=bundle/command-t/ruby/command-t/
CACHE_PATH=$(HOME)/.local/share/vim/
CACHE_DIRS=$(addprefix $(CACHE_PATH),swap backup undo)

.PHONY: all links vundle commandt submodule

all: links vundle commandt $(CACHE_DIRS)

links: $(HOME)/.vim $(HOME)/.vimrc

$(HOME)/.vim: .
	ln -sf $(abspath $<) $@

$(HOME)/.vimrc: vimrc
	ln -sf $(abspath $<) $@

vundle: submodule
	vim -c ':BundleInstall' -c ':qall'

commandt:
	cd $(COMMANDT_DIR); \
		ruby extconf.rb
	make -C $(COMMANDT_DIR)

submodule:
	git submodule update --init --recursive

$(CACHE_DIRS): %:
	mkdir -p $@
