filetype off                   " required for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'Lokaltog/vim-powerline'
Plugin 'SirVer/ultisnips'
Plugin 'fatih/vim-go'
Plugin 'gcmt/taboo.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'majutsushi/tagbar'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sensible'

" color schemes
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on     " required!
