runtime! indent.vim
runtime! fvl.vim

" NERDTree settings
let NERDTreeWinSize=20
let NERDTreeIgnore=['.o$', '.pyc$', '\~$']

let g:SuperTabNoCompleteAfter=['^', '\s', ',']
"let g:SuperTabMappingForward='<s-tab>'
"let g:SuperTabMappingBackward='<tab>'
let g:SuperTabDefaultCompletionType = "context"

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

let g:pymode_lint = 1 "FIXME
"let g:pymode_lint_ignore = 'R0201,C0110,C1001,C0301,E302,E201,E202,E301,E501,W0511'
let g:pymode_lint_ignore = 'R0201,C0110,C1001,C0301,W0511'

let g:syntastic_python_checkers=['flake8']

" disable docstring popup window
autocmd FileType python setlocal completeopt-=preview
