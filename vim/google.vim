if filereadable("/usr/share/vim/google/google.vim")
    source /usr/share/vim/google/google.vim
    Glug youcompleteme-google
    Glug g4
    Glug grok
    Glug blaze plugin[mappings]='<leader>b'
    Glug ultisnips-google
    nnoremap <leader>gd  :<c-u>GrokDef<cr><cr>:lr<cr>
    nnoremap <leader>f :ClangFormat<cr>
    nnoremap <c-n>  :lne<cr>
    nnoremap <c-p>  :lpr<cr>
else
    Plugin 'klen/python-mode'
    if v:version >= 736
        Plugin 'Valloric/YouCompleteMe'
    endif
endif

if filereadable("/usr/share/vim/google/gtags.vim")
    source /usr/share/vim/google/gtags.vim
    nnoremap <C-]> :exe 'Gtlist ' . expand('<cword>')<CR>
endif
