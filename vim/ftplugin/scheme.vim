" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

setlocal expandtab
setlocal ts=2
setlocal sw=2

let g:run_cmd="!csi %"
let g:repl_cmd="csi"
let g:repl_filetype="scheme"
setlocal lisp
