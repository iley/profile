filetype off                   " required for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" required by snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

" plugins
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'
Bundle 'exu/pgsql.vim'
Bundle 'fatih/vim-go'
Bundle 'honza/vim-snippets'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'garbas/vim-snipmate'
Bundle 'gcmt/taboo.vim'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'guns/vim-clojure-static'
Bundle 'kana/vim-fakeclip'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-scripts/slimv.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'vimwiki/vimwiki'

" color schemes
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!
