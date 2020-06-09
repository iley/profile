call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'hashivim/vim-terraform'
Plug 'lifepillar/vim-solarized8'
Plug 'psf/black'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

call plug#end()

" NERDTree settings
let NERDTreeIgnore=['\.o$', '\.pyc$', '\~$']

" vim-go settings
let g:go_template_autocreate = 0

" autocmd BufWritePre *.py execute ':Black'
let g:black_virtualenv="~/.vim_black"
