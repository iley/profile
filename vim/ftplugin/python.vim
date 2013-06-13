" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

if exists('+colorcolumn')
    setlocal colorcolumn=81 "highlight long lines
endif

setlocal tabstop=4
setlocal shiftwidth=4
compiler python
