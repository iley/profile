filetype off                   " required for vundle

set rtp+=~/.vim/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" plugins
Bundle 'Lokaltog/vim-powerline'
Bundle 'adimit/prolog.vim'
Bundle 'aliva/vim-fish'
Bundle 'davidoc/taskpaper.vim'
Bundle 'exu/pgsql.vim'
Bundle 'gcmt/taboo.vim'
Bundle 'godlygeek/tabular'
Bundle 'jnwhiteh/vim-golang'
Bundle 'kana/vim-fakeclip'
Bundle 'klen/python-mode'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'motemen/xslate-vim'
Bundle 'msanders/snipmate.vim'
Bundle 'olethanh/Vim-nosecompiler'
Bundle 'petdance/vim-perl'
Bundle 'reinh/vim-makegreen'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'sickill/vim-pasta'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-obsession'
Bundle 'tpope/vim-rsi'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/slimv.vim'
Bundle 'wting/rust.vim'
Bundle 'git://git.wincent.com/command-t.git'

" color schemes
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!
