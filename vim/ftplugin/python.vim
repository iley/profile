" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

setlocal ts=4
setlocal sw=4
let g:run_cmd="!python %"
let g:repl_cmd="python"
let g:repl_filetype="python"
compiler python
setlocal makeprg=python\ -c\ \"import\ py_compile;\ py_compile.compile(r'%')\"
call HighlightLongLines()
