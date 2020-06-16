noremap ; :

" Clear search highlighting with CTRL-L.
noremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

noremap <C-PageDown> :Tbbn<CR>
noremap <C-PageUp>   :Tbbp<CR>

set pastetoggle=<F2>
noremap <F4> :NERDTreeToggle<CR>
noremap <F9> :TagbarToggle<CR>

noremap <F5> :Autoformat<CR>
noremap <leader>f :Autoformat<CR>

" hotkey for a.vim plugin
noremap <Leader>a :A<CR>

noremap <Leader>y "+y
noremap <Leader>Y "+Y
noremap <Leader>p "+p
noremap <Leader>P "+P

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <leader>t <Plug>(go-test)

au FileType scala inoremap <silent><expr> <c-tab> coc#refresh()
au FileType scala nmap <silent> [c <Plug>(coc-diagnostic-prev)
au FileType scala nmap <silent> ]c <Plug>(coc-diagnostic-next)
au FileType scala nmap <silent> gd <Plug>(coc-definition)
au FileType scala nmap <silent> gy <Plug>(coc-type-definition)
au FileType scala nmap <silent> gi <Plug>(coc-implementation)
au FileType scala nmap <silent> gr <Plug>(coc-references)
au FileType scala nmap <silent> <leader>f <Plug>(coc-format)
