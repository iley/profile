filetype off                   " required for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" For vim-codefmt.
Plugin 'google/vim-glaive'
Plugin 'google/vim-maktaba'

Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'exclipy/clang_indexer'
Plugin 'gcmt/taboo.vim'
Plugin 'google/vim-codefmt'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-pasta'
Plugin 'sirtaj/vim-openscad'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sensible'
Plugin 'vim-scripts/a.vim'

Plugin 'fatih/vim-go'
Plugin 'python-mode/python-mode'
"Plugin 'rhysd/vim-clang-format'
"
if v:version >= 704
  Plugin 'SirVer/ultisnips'
endif

call vundle#end()
filetype plugin indent on     " required!

call glaive#Install()

" NERDTree settings
let NERDTreeIgnore=['.o$', '.pyc$', '\~$']

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

let g:pymode = 0

Glaive codefmt clang_format_style=file
Glaive codefmt clang_format_executable=clang-format-5.0
