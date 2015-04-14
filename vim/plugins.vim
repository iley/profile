runtime! indent.vim
runtime! fvl.vim

" NERDTree settings
let NERDTreeWinSize=20
let NERDTreeIgnore=['.o$', '.pyc$', '\~$']

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto=0
" Show clang errors in the quickfix window
let g:clang_complete_copen=1

if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    " Do Mac stuff here
  elseif s:uname == "Linux"
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
  endif
endif

" taboo
let g:taboo_tab_format = ' %N:%f%m '

" python-mode
let g:pymode_lint_on_write = 1

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
