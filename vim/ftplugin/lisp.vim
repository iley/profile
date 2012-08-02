" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

let g:run_cmd="!sbcl --noinform --load %"
let g:repl_cmd="sbcl --noinform"

let g:repl_filetype="lisp"
setlocal lisp
