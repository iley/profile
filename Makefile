HOME_SRC=bashrc gitconfig_global gitignore_global tmux.conf zshrc gdbinit ideavimrc npmrc hammerspoon
HOME_DST=$(addprefix $(HOME)/.,$(HOME_SRC))
NODOT_SRC=
NODOT_DST=$(addprefix $(HOME)/,$(NODOT_SRC))

CONFIG_SRC=alacritty i3status nvim fish sway
CONFIG_DST=$(addprefix $(HOME)/.config/,$(CONFIG_SRC))

OHMYZSH=~/.oh-my-zsh

.PHONY: all links

all: links ~/.localrc ~/.gitconfig ~/.local.fish

links: $(HOME_DST) $(NODOT_DST) $(CONFIG_DST) $(OHMYZSH)

$(OHMYZSH):
	git clone https://github.com/robbyrussell/oh-my-zsh.git $@

$(HOME_DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

$(NODOT_DST): $(HOME)/%: %
	ln -sf $(abspath $<) $@

$(CONFIG_DST): $(HOME)/.config/%: %
	mkdir -p $(HOME)/.config
	ln -sf $(abspath $<) $@

~/.gitconfig:
	cp gitconfig_template ~/.gitconfig

~/.localrc:
	ln -sf $(HOME)/profile/local/$(shell hostname|cut -d. -f1) $(HOME)/.localrc

~/.local.fish:
	ln -sf $(HOME)/profile/local/$(shell hostname|cut -d. -f1).fish $(HOME)/.local.fish
