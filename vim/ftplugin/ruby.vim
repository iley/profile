" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

setlocal makeprg=rake
let g:run_cmd="!irb -r %"
let g:repl_cmd="irb"
let g:repl_filetype="ruby"
