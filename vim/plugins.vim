call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'ekalinin/Dockerfile.vim'
Plug 'gcmt/taboo.vim'
Plug 'hashivim/vim-terraform'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'psf/black'
Plug 'towolf/vim-helm'

Plug 'fatih/vim-go', { 'for': 'go' }

call plug#end()

" NERDTree settings
let NERDTreeIgnore=['\.o$', '\.pyc$', '\~$']

" taboo
let g:taboo_tab_format = ' %N:%f%m '

" vim-go settings
let g:go_template_autocreate = 0

" autocmd BufWritePre *.py execute ':Black'
let g:black_virtualenv="~/.vim_black"
