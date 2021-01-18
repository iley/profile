SRC=bashrc gitconfig_global gitignore_global tmux.conf zshrc gdbinit
DST=$(addprefix $(HOME)/.,$(SRC))
OHMYZSH=~/.oh-my-zsh

.PHONY: all links vimstuff

all: links vimstuff ~/.localrc ~/.gitconfig

links: $(DST) $(OHMYZSH) ~/.config/i3

$(OHMYZSH):
	git clone https://github.com/robbyrussell/oh-my-zsh.git $@

$(DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

~/.config/i3: ~/.config i3
	mkdir -p ~/.config
	ln -sf $(abspath $<) $@

~/.gitconfig:
	cp gitconfig_template ~/.gitconfig

~/.localrc:
	ln -s $(HOME)/profile/local/$(shell hostname|cut -d. -f1) $(HOME)/.localrc


vimstuff:
	make -C vim
