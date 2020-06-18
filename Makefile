SRC=bashrc gitconfig_global gitignore_global tmux.conf zshrc gdbinit
DST=$(addprefix $(HOME)/.,$(SRC))
OHMYZSH=~/.oh-my-zsh

.PHONY: all links vimstuff

all: links vimstuff ~/.gitconfig

links: $(DST) $(OHMYZSH)

$(OHMYZSH):
	git clone https://github.com/robbyrussell/oh-my-zsh.git $@

$(DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

~/.gitconfig:
	cp gitconfig_template ~/.gitconfig

vimstuff:
	make -C vim
