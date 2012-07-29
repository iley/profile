runtime! indent.vim
runtime! fvl.vim

set nocompatible               " be iMproved
filetype off                   " required for vundle

set rtp+=~/.vim/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'sickill/vim-pasta'
Bundle 'scrooloose/nerdtree'
Bundle 'adimit/prolog.vim'
Bundle 'motemen/xslate-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'petdance/vim-perl'
Bundle 'yko/mojo.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sitaramc/map'
Bundle 'klen/python-mode'

" My Bundles here:
" original repos on github

filetype plugin indent on     " required!

" --- supplementary functions ---

func! StartRepl()
	exec "ConqueTermSplit " . g:repl_cmd
	if (g:repl_filetype != "")
		exec "set filetype=" . g:repl_filetype
	endif
	exec "normal 10\<c-w>_"
	exec "normal \<c-w>\<c-w>"
	stopinsert
endfunc

func! Run()
	exec g:run_cmd
endfunc

"default run_cmd
let g:run_cmd = "!./%<" 

" --- user commands ---

command! -nargs=0 -bang WSudo :silent! w !sudo tee % &>/dev/null
command! -nargs=0 Vimrc :tabnew $MYVIMRC
command! -nargs=0 Run :call Run()

" hotkeys
noremap <C-PageDown> :Tbbn<CR>
noremap <C-PageUp>   :Tbbp<CR>

noremap <F2> :w<CR>
noremap <F4> :NERDTreeToggle<CR>
noremap <F5> :call Run()<CR>
noremap <F9> :make<CR>

" hotkey for FuzzyFinder plugin
map <Leader>f :FufFile<CR>
map <Leader>b :FufBuffer<CR>

" hotkey for a.vim plugin
map <Leader>a :A<CR>

syntax enable

" language settings
language en_US.UTF-8
language messages en_US.UTF-8
set fileencodings=utf-8,koi8-r,windows-1251,iso-8859-15

" store swap files in a separate directory
set directory=~/.vim/swap

" indentation settings
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set smartindent
" remove extra spaces during indentation
set shiftround

" use dialogs instead of messages (disabled for ubuntu)
" set confirm

" show matching braces
set showmatch

" decrease delay
set matchtime=1

set wrap
set nocompatible
set backspace=indent,eol,start

" search and replace
set incsearch
set nohlsearch
set ignorecase " ignore case...
set smartcase  " ... if the query is in lower case

set title
set ruler

set autowrite
set updatetime=120000
set autoread
set hidden

if($TERM != "linux")
	" use more colors
	set t_Co=256

	let g:solarized_termcolors=256
	set background=dark
	colorscheme solarized
endif

" autocomplete based on regsiter of entered part
set infercase

" folding settings
set foldmethod=manual
set foldlevel=1
set nofoldenable

" move to next line at beginning/line of the current
set whichwrap=h,l,<,>,[,]

" turn off speaker
set vb t_vb="

set wildignore+=*.o,*.bak,*/.git/*,*/.hg/*,*/.svn/*

set number

" options below are taken from http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
	autocmd BufReadPost *
				\ if expand("<afile>:p:h") !=? $TEMP |
				\ if line("'\"") > 1 && line("'\"") <= line("$") |
				\ let JumpCursorOnEdit_foo = line("'\"") |
				\ let b:doopenfold = 1 |
				\ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
				\ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
				\ let b:doopenfold = 2 |
				\ endif |
				\ exe JumpCursorOnEdit_foo |
				\ endif |
				\ endif
	" Need to postpone using "zv" until after reading the modelines.
	autocmd BufWinEnter *
				\ if exists("b:doopenfold") |
				\ exe "normal zv" |
				\ if(b:doopenfold > 1) |
				\ exe "+".1 |
				\ endif |
				\ unlet b:doopenfold |
				\ endif
augroup END

set backup

" save «smart» backups every day
function! BackupDir()
	let l:backupdir=$HOME.'/.vim/backup/'.
				\substitute(expand('%:p:h'), '^'.$HOME, '~', '')

	if !isdirectory(l:backupdir)
		call mkdir(l:backupdir, 'p', 0700)
	endif

	let &backupdir=l:backupdir
	let &backupext=strftime('~%Y-%m-%d~')
endfunction

autocmd! bufwritepre * call BackupDir()

" automatically save/load folds on buffer close/open
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

if version >= 730
	set undodir=~/.vim/undo
	set undofile
	set undolevels=1000
	set undoreload=10000
endif

augroup filetypedetect
	au! BufNewfile,BufRead *.ejs set filetype=html
	au! BufNewFile,BufRead *.tex,*.ltx set filetype=tex
	au! BufNewfile,BufRead Construct,Consfile set filetype=perl
	au! BufNewFile,BufRead *.clj set filetype=clojure
	au! BufNewFile,BufRead *.tt2 set filetype=tt2html
	au! BufNewFile,BufRead *.rsl set filetype=rsl
	au! BufNewFile,BufRead *.pro set filetype=prolog
	au! BufNewFile,BufRead *.go set filetype=go
	au! BufNewFile,BufRead *.pasm set filetype=parrot
	au! BufNewFile,BufRead *.i set filetype=swig
	au! BufNewFile,BufRead *.xslate setfiletype xslate
	au! BufNewFile,BufRead *.cpp setfiletype cpp11
augroup end

au! BufNewFile,BufRead * set vb t_vb="

" NERDTree settings
let NERDTreeWinSize=20
let NERDTreeIgnore=['.o$', '.pyc$', '\~$']

autocmd BufNewFile job exe "normal O#!/usr/bin/stbx-mrproc\n"

" ---- from statbox vimrc ----
" Suffixes that get lower priority when doing tab completion for filenames.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set suffixesadd=.pl,.pm,.yml,.yaml " for `gf' (open file under cursor)

"set t_ti= t_te= " do not clear screen on exit

set nolist
"set list listchars=tab:→\ ,trail:· " show tabs and trailing spaces (by fedor-n)

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15

" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType="context"

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto=0
" Show clang errors in the quickfix window
let g:clang_complete_copen=1

" --- GUI settings ---
if has("gui_running")
	set guioptions-=T " do not show toolbar
	set guioptions-=t " do not show tearoffs in menu
	set guifont=PragmataPro\ 12
endif

" ack settings
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" Powerline
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
"let g:Powerline_symbols="fancy"
