" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

if g:uname == "Darwin"
  let g:run_cmd="!ccl64 --load %"
  let g:repl_cmd="ccl64"
else
  "let g:run_cmd="!clisp -q -repl %"
  "let g:repl_cmd="clisp -q"
  let g:run_cmd="!sbcl --noinform --load %"
  let g:repl_cmd="sbcl --noinform"
endif

let g:repl_filetype="lisp"
setlocal lisp

runtime plugin/RainbowParenthsis.vim 
