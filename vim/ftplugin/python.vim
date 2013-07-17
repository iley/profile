let b:did_ftplugin = 1

if exists('+colorcolumn')
    setlocal colorcolumn=81 "highlight long lines
endif

setlocal tabstop=4
setlocal shiftwidth=4
compiler python
