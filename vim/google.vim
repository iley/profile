if filereadable("/usr/share/vim/google/google.vim")
    source /usr/share/vim/google/google.vim
endif

if filereadable("/usr/share/vim/google/gtags.vim")
    source /usr/share/vim/google/gtags.vim
    nnoremap <C-]> :exe 'Gtlist ' . expand('<cword>')<CR>
endif
