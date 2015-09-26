filetype off                   " required for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'Lokaltog/vim-powerline'
Plugin 'SirVer/ultisnips'
Plugin 'exu/pgsql.vim'
Plugin 'fatih/vim-go'
Plugin 'gcmt/taboo.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'honza/vim-snippets'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'kana/vim-fakeclip'
Plugin 'lambdatoast/elm.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/slimv.vim'

" color schemes
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on     " required!
