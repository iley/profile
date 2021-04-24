syntax on
set number
set ruler
set modeline

" Basic editing
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab
set shiftround " remove extra spaces during indentation
set nowrap
set formatoptions+=j " deletes the comment character when joining lines
set nojoinspaces

" Search and replace
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic

if maparg('<C-L>', 'n') ==# ''
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Disable mouse
set mouse=

noremap ; :

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'lifepillar/vim-solarized8'
Plug 'psf/black', { 'for': 'python' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

if has#colorscheme('solarized8')
    set background=dark
    colorscheme solarized8
endif

" NERDTree settings
let NERDTreeIgnore=['\.o$', '\.pyc$', '\~$']

" vim-go settings
let g:go_template_autocreate = 0
let g:go_fmt_command = "goimports"

" Telescope settings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
