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

" nvim-go deps
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
" nvim-go
Plug 'crispgm/nvim-go'

Plug 'lifepillar/vim-solarized8'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'a-vrma/black-nvim', {'do': ':UpdateRemotePlugins'}
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

set pastetoggle=<F2>
noremap <F4> :NERDTreeToggle<CR>

" Telescope key bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

" Highlight trailing spaces.
"set list listchars=trail:_,extends:>
