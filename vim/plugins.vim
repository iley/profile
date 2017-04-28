filetype off                   " required for vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'VundleVim/Vundle.vim'

" required by vim-markdown for formatting tables
Plugin 'godlygeek/tabular'

Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'gcmt/taboo.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sensible'
Plugin 'vim-scripts/a.vim'

if !g:google_machine
  Plugin 'fatih/vim-go'
  Plugin 'klen/python-mode'
  Plugin 'rhysd/vim-clang-format'
  if v:version >= 736
    Plugin 'Valloric/YouCompleteMe'
  endif
  if v:version >= 704
    Plugin 'SirVer/ultisnips'
  endif
endif

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

" vim-go settings
let g:go_template_autocreate = 0
