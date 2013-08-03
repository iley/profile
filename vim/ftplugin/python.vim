let b:did_ftplugin = 1

if exists('+colorcolumn')
    setlocal colorcolumn=80,100 " according to PEP8
endif

setlocal tabstop=4
setlocal shiftwidth=4
compiler python
