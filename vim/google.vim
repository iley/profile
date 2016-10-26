source /usr/share/vim/google/google.vim
Glug youcompleteme-google

let g:ycm_filetype_blacklist = {'javascript': 1}

Glug g4
Glug grok
Glug blaze plugin[mappings]='<leader>b'
Glug ultisnips-google

if filereadable("/usr/share/vim/google/gtags.vim")
    source /usr/share/vim/google/gtags.vim
    nnoremap <C-]> :exe 'Gtlist ' . expand('<cword>')<cr>
endif

" CtrlP
let g:ctrlp_directories = map(['google3/storage/x20', 'google3/production/borg/x20', 'google3/experimental/users/istrukov'], 'piperlib#GetRootDir() . v:val')
augroup ctrlp_user_command
  autocmd!
  "Ag version
  autocmd BufNewFile,BufRead,VimEnter * let g:ctrlp_user_command = 'echo %s > /dev/null; '
        \ . join(map(copy(g:ctrlp_directories),
        \ '''ag '' . v:val . '' --nocolor --nogroup --ignore "**/*.pyc" -g ""'''), ' ; ')
augroup END

function! g:DispatchBlazeBuild()
  execute 'Dispatch blaze build ' . blaze#GetTargets()
endfunction

function! g:DispatchBlazeTest()
  execute 'Dispatch blaze test ' . blaze#GetTestTargets()
endfunction

function! g:DispatchBuildCleaner()
  execute 'Dispatch build_cleaner ' . blaze#GetTargets()
endfunction

nnoremap <c-n>  :lne<cr>
nnoremap <c-p>  :lpr<cr>
nnoremap <leader>gd  :<c-u>GrokDef<cr><cr>:lr<cr>
nnoremap <leader>f :ClangFormat<cr>
nnoremap <leader>cf :ClangFormat<cr>
nnoremap <leader>cr :pyf /google/src/head/depot/google3/third_party/llvm/llvm/tools/clang/tools/extra/clang-rename/tool/clang-rename.py<cr>
nnoremap <leader>xb :call g:DispatchBlazeBuild()<cr>
nnoremap <leader>xt :call g:DispatchBlazeTest()<cr>
nnoremap <leader>xc :call g:DispatchBuildCleaner()<cr>
nnoremap <leader>xi :pyf /google/data/ro/projects/cymbal/tools/include-fixer/clang-include-fixer.py<cr>
