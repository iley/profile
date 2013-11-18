filetype off                   " required for vundle

set rtp+=~/.vim/vundle/
call vundle#rc()

" let Vundle manage Vundle (required)
Bundle 'gmarik/vundle'

" required by snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

" plugins
Bundle 'Lokaltog/vim-powerline'
Bundle 'adimit/prolog.vim'
Bundle 'davidoc/taskpaper.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'exu/pgsql.vim'
Bundle 'freitass/todo.txt-vim'
Bundle 'garbas/vim-snipmate'
Bundle 'gcmt/taboo.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'jnwhiteh/vim-golang'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/slimv.vim'

" color schemes
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!
