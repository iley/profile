SRC=XCompose bashrc gitconfig i3 i3status.conf inputrc mplayer oh-my-zsh \
perldb perltidyrc racketrc sbclrc screen screenrc ssh/config taskrc tmux.conf \
xinitrc zshrc psqlrc fonts.conf pentadactylrc Xdefaults Xmodmap zsh
DST=$(addprefix $(HOME)/.,$(SRC))
TWMN_DIR=$(HOME)/.config/twmn
SSH_CONN_DIR=$(HOME)/.ssh/connections

.PHONY: all links rvm submodule ssh_conn

all: links submodule vim

links: $(DST) $(HOME)/bin $(TWMN_DIR)/twmn.conf

ssh_conn: $(SSH_CONN_DIR)

$(SSH_CONN_DIR):
	mkdir -p $(SSH_CONN_DIR)
	chmod 700 $(HOME)/.ssh $(SSH_CONN_DIR)

$(DST): $(HOME)/.%: %
	ln -sf $(abspath $<) $@

$(HOME)/.ssh/config: ssh_conn

$(TWMN_DIR)/twmn.conf: twmn.conf
	mkdir -p $(TWMN_DIR)
	ln -sf $(abspath $<) $@

$(HOME)/bin: bin
	ln -sf $(abspath $<) $@

rvm:
	curl -L get.rvm.io | bash -s stable --ruby

vim:
	git clone git@github.com:iley/vimrc vim
	make -C vim

submodule:
	git submodule update --init --recursive
