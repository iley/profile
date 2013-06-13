runtime! indent.vim
runtime! fvl.vim

" NERDTree settings
let NERDTreeWinSize=20
let NERDTreeIgnore=['.o$', '.pyc$', '\~$']

" SuperTab option for context aware completion 
let g:SuperTabDefaultCompletionType="context"

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto=0
" Show clang errors in the quickfix window
let g:clang_complete_copen=1

" ack settings
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
"let g:Powerline_symbols="fancy"

" python settings
let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint_write = 1
"let g:pymode_lint_onfly = 1
let g:pymode_utils_whitespaces = 0
let g:pymode_folding = 1
let g:pymode_syntax = 0

" lisp settings
let g:paredit_mode = 0

" yankring
let g:yankring_history_dir = '$HOME/.vim'

" taboo
let g:taboo_tab_format = ' %N:%f%m '

" custom python highlighting options
let g:python_highlight_all = 1
let g:python_slow_sync = 1
