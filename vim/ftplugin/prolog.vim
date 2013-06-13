" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

setlocal expandtab
setlocal sw=2
setlocal ts=2

let g:run_cmd="!swipl -s %"
let g:repl_cmd="swipl"
let g:repl_filetype="prolog"
