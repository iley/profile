noremap ; :

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
