filetype off                   " required for vundle

set rtp+=~/.vim/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" plugins
Bundle 'Lokaltog/vim-powerline'
Bundle 'adimit/prolog.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'davidoc/taskpaper.vim'
Bundle 'ervandew/supertab'
Bundle 'exu/pgsql.vim'
Bundle 'gcmt/taboo.vim'
Bundle 'hdima/python-syntax'
Bundle 'jnwhiteh/vim-golang'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-sensible'
Bundle 'vim-scripts/slimv.vim'
Bundle 'wting/rust.vim'
Bundle 'git://git.wincent.com/command-t.git'

" color schemes
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!
