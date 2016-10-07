Glug youcompleteme-google
Glug g4
Glug grok
Glug blaze plugin[mappings]='<leader>b'
Glug ultisnips-google
nnoremap <leader>gd  :<c-u>GrokDef<cr><cr>:lr<cr>
nnoremap <c-n>  :lne<cr>
nnoremap <c-p>  :lpr<cr>

if filereadable("/usr/share/vim/google/gtags.vim")
    source /usr/share/vim/google/gtags.vim
    nnoremap <C-]> :exe 'Gtlist ' . expand('<cword>')<CR>
endif

" CtrlP
let g:ctrlp_directories = map(['google3/storage/x20', 'google3/production/borg/x20'], 'piperlib#GetRootDir() . v:val')
augroup ctrlp_user_command
  autocmd!
  "Ag version
  autocmd BufNewFile,BufRead,VimEnter * let g:ctrlp_user_command = 'echo %s > /dev/null; '
        \ . join(map(copy(g:ctrlp_directories),
        \ '''ag '' . v:val . '' --nocolor --nogroup --ignore "**/*.pyc" -g ""'''), ' ; ')
augroup END
