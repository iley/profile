if filereadable("/usr/share/vim/google/google.vim")
    source /usr/share/vim/google/google.vim
    Glug youcompleteme-google
elseif v:version >= 736
    Bundle 'Valloric/YouCompleteMe'
endif

if filereadable("/usr/share/vim/google/gtags.vim")
    source /usr/share/vim/google/gtags.vim
    nnoremap <C-]> :exe 'Gtlist ' . expand('<cword>')<CR>
endif
