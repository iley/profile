HOME_SRC=bashrc gitconfig_global gitignore_global tmux.conf zshrc gdbinit
HOME_DST=$(addprefix $(HOME)/.,$(HOME_SRC))

CONFIG_SRC=i3 nvim
CONFIG_DST=$(addprefix $(HOME)/.config/,$(CONFIG_SRC))

OHMYZSH=~/.oh-my-zsh

.PHONY: all links

all: links ~/.localrc ~/.gitconfig

links: $(HOME_DST) $(CONFIG_DST) $(OHMYZSH)

$(OHMYZSH):
	git clone https://github.com/robbyrussell/oh-my-zsh.git $@

$(HOME_DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

$(CONFIG_DST): $(HOME)/.config/%: %
	mkdir -p $(HOME)/.config
	ln -sf $(abspath $<) $@

~/.gitconfig:
	cp gitconfig_template ~/.gitconfig

~/.localrc:
	ln -s $(HOME)/profile/local/$(shell hostname|cut -d. -f1) $(HOME)/.localrc
