" supplementary functions

func! StartRepl()
    exec "ConqueTermSplit " . g:repl_cmd
    if (g:repl_filetype != "")
        exec "set filetype=" . g:repl_filetype
    endif
    exec "normal 10\<c-w>_"
    exec "normal \<c-w>\<c-w>"
    stopinsert
endfunc
