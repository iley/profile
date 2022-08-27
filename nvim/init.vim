syntax on
set number
set ruler
set modeline

" Basic editing
set tabstop=2
set shiftwidth=2
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

" C autoindent options
set cinoptions=l1 " switch case indents

if maparg('<C-L>', 'n') ==# ''
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Disable mouse
set mouse=

noremap ; :

" Plugins
call plug#begin('~/.vim/plugged')

" nvim-go deps
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
" nvim-go
Plug 'crispgm/nvim-go'

Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}
Plug 'hashivim/vim-terraform'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'ngmy/vim-rubocop'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-obsession'
Plug 'vim-scripts/a.vim'

" Colors
Plug 'morhetz/gruvbox'
" Plug 'lifepillar/vim-solarized8'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

if (has("termguicolors"))
    set termguicolors
endif

if has#colorscheme('gruvbox')
    colorscheme gruvbox
elseif has#colorscheme('solarized8')
    set background=dark
    colorscheme solarized8
else
   colors pablo
endif

augroup custom_ft
    au!
    autocmd BufNewFile,BufRead *.sky set syntax=python
augroup END

" Airline settings
let g:airline_powerline_fonts = 1

" NERDTree settings
let NERDTreeIgnore=['\.o$', '\.pyc$', '\~$']

set pastetoggle=<F2>
noremap <F4> :NERDTreeToggle<cr>
noremap <leader>tt <cmd>NERDTreeToggle<cr>
noremap <leader>tc <cmd>NERDTreeCWD<cr>
noremap <leader>tf <cmd>NERDTreeFocus<cr>

" Telescope key bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" a.vim
nnoremap <leader>a <cmd>A<cr>

" Language Servers
lua require('languages')

" LSP key bindings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" Completion settings
set completeopt=menuone,noinsert,noselect

" Use Tab/S-Tab for navigating in popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Escape in terminal mode
:tnoremap <Esc> <C-\><C-n>

" Python Black
command Black :call Black()<cr>

" Backup settings
set backup
set backupcopy=yes
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//

" Undo settings
set undofile
set undodir=~/.config/nvim/undo//

" Highlight trailing spaces.
"set list listchars=trail:_,extends:>
