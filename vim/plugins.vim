runtime! indent.vim
runtime! fvl.vim

" NERDTree settings
let NERDTreeWinSize=20
let NERDTreeIgnore=['.o$', '.pyc$', '\~$']

let g:SuperTabNoCompleteAfter=['^', '\s', ',']

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto=0
" Show clang errors in the quickfix window
let g:clang_complete_copen=1

" ack settings
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs

" lisp settings
let g:paredit_mode = 0

" yankring
let g:yankring_history_dir = '$HOME/.vim'

" taboo
let g:taboo_tab_format = ' %N:%f%m '

" custom python highlighting options
let g:python_highlight_all = 1
let g:python_slow_sync = 1

let g:syntastic_python_checkers=['pyflakes']
