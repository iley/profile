filetype off                   " required for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" required by vim-markdown for formatting tables
Plugin 'godlygeek/tabular'

" plugins
Plugin 'Lokaltog/vim-powerline'
Plugin 'chase/vim-ansible-yaml'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'fatih/vim-go'
Plugin 'gcmt/taboo.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mxw/vim-jsx'
Plugin 'plasticboy/vim-markdown'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sensible'
Plugin 'vim-scripts/a.vim'

if v:version >= 704
  Plugin 'SirVer/ultisnips'
endif

if !g:google_machine
  Plugin 'klen/python-mode'
  if v:version >= 736
    Plugin 'Valloric/YouCompleteMe'
  endif
endif

" color schemes
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on     " required!

" NERDTree settings
let NERDTreeWinSize=20
let NERDTreeIgnore=['.o$', '.pyc$', '\~$']

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
