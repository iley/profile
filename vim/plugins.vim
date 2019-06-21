call plug#begin('~/.vim/plugged')

" apt-get install build-essential python3-dev cmake
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'altercation/vim-colors-solarized'
Plug 'ekalinin/Dockerfile.vim'
Plug 'gcmt/taboo.vim'
Plug 'hashivim/vim-terraform'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'lifepillar/pgsql.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/a.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" for faster ctrl-p
Plug 'nixprime/cpsm', { 'do': './install.sh' }
let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }

Plug 'fatih/vim-go', { 'for': 'go' }

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

let g:ycm_filetype_blacklist = { 'python': 1 }

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <leader>t <Plug>(go-test)
