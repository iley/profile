" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

setlocal cin
setlocal tags+=~/.vim/tags/cpp

setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
