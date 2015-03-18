if filereadable("/usr/share/vim/google/google.vim")
    source /usr/share/vim/google/google.vim
    Glug youcompleteme-google
    Glug grok
    Glug blaze plugin[mappings]='<leader>b'
    nnoremap <leader>gd  :<c-u>GrokDef<cr><cr>:lr<cr>
    nnoremap <c-n>  :lne<cr>
    nnoremap <c-p>  :lpr<cr>
elseif v:version >= 736
    Bundle 'Valloric/YouCompleteMe'
endif

if filereadable("/usr/share/vim/google/gtags.vim")
    source /usr/share/vim/google/gtags.vim
    nnoremap <C-]> :exe 'Gtlist ' . expand('<cword>')<CR>
endif
