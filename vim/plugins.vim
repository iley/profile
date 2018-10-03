call plug#begin('~/.vim/plugged')

" apt-get install build-essential python3-dev cmake
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'altercation/vim-colors-solarized'
Plug 'davidoc/taskpaper.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'gcmt/taboo.vim'
Plug 'honza/vim-snippets'
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
Plug 'samsaga2/vim-z80'
Plug 'hashivim/vim-terraform'

Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'python-mode/python-mode', { 'for': 'python' }

" for faster ctrl-p
Plug 'nixprime/cpsm', { 'do': './install.sh' }
let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }

if v:version >= 704
  Plug 'SirVer/ultisnips'
endif

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

" python-mode
let g:pymode_lint_on_write = 1
let g:pymode_rope_completion = 0
let g:pymode_options_max_line_length = 100


let g:syntastic_python_checkers=['flake8']
let g:syntastic_cpp_compiler_options = '-std=c++11'

" disable docstring popup window
autocmd FileType python setlocal completeopt-=preview

let g:syntastic_mode_map = { "mode": "active",
                           \ "active_filetypes": [],
                           \ "passive_filetypes": ["cpp"] }

" UltiSnips conflicts with YouCompleteMe
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" vim-go settings
let g:go_template_autocreate = 0

" let g:pymode = 0

let g:ycm_filetype_blacklist = { 'python': 1 }
