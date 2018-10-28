call plug#begin('~/.vim/plugged')

" apt-get install build-essential python3-dev cmake
Plug 'altercation/vim-colors-solarized'
Plug 'dag/vim-fish'
Plug 'davidoc/taskpaper.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'gcmt/taboo.vim'
Plug 'hashivim/vim-terraform'
Plug 'kien/ctrlp.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sickill/vim-pasta'
Plug 'sirtaj/vim-openscad'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/a.vim'

Plug 'fatih/vim-go', { 'for': 'go' }

" for faster ctrl-p
Plug 'nixprime/cpsm', { 'do': './install.sh' }
let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }


call plug#end()

" NERDTree settings
let NERDTreeIgnore=['\.o$', '\.pyc$', '\~$']

let g:clang_library_path='/usr/lib/llvm-3.8/lib'
" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto=0
" Show clang errors in the quickfix window
let g:clang_complete_copen=1

" taboo
let g:taboo_tab_format = ' %N:%f%m '

" vim-go settings
let g:go_template_autocreate = 0

" let g:pymode = 0

let g:ycm_filetype_blacklist = { 'python': 1 }
