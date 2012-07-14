runtime! indent.vim
runtime! fvl.vim

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if match($TERM, "screen")!=-1
	"commented out to avoid problems with tmux
	"set term=xterm
	let g:GNU_Screen_used = 1
else
	let g:GNU_Screen_used = 0
endif

let g:run_cmd=''
let g:repl_cmd='bash'
let g:repl_filetype=''

" detect OS type
let g:uname = "Unknown"
if has("unix")
	let g:uname = system("echo -n \"$(uname)\"")
elseif has("win32")
	let g:uname = "Windows"
endif

" --- supplementary functions ---

func! GenUses()
	exec "normal o"
	exec ".!~/.vim/genuse.pl %"
endfunction

func! CleanClose()
	let todelbufNr = bufnr("%")
	let newbufNr = bufnr("#")
	if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
		exe "b".newbufNr
	else
		bnext
	endif

	if (bufnr("%") == todelbufNr)
		new
	endif
	exe "bd".todelbufNr
	"call Buftabs_show()
endfunction

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

func! SetMakeProg(cmd)
	if filereadable("Jamroot") || filereadable("Jamfile")
		setlocal makeprg=bjam
	elseif filereadable("Construct") || filereadable("Consfile")
		setlocal makeprg=cons
	elseif filereadable("Makefile")
		setlocal makeprg=make
	elseif filereadable("Rakefile")
		setlocal makeprg=rake
	else
		exec "setlocal makeprg=" . escape(a:cmd, " ")
	endif
endfunc

func! UpdateTags()
	exec "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
endfunc

func! CIMap(key, seq)
	exec "map " . a:key . " " . a:seq
	exec "imap " . a:key . " <ESC>" . a:seq
endfunc

" --- user commands ---

command! -nargs=0 -bang WSudo :silent! w !sudo tee % &>/dev/null
command! -nargs=0 Vimrc :tabnew $MYVIMRC
command! -nargs=+ CIMap :call CIMap(<f-args>)
command! -nargs=0 UpdateTags :call UpdateTags()
command! -nargs=0 Run :call Run()
command! -nargs=0 Repl :call StartRepl()
command! -nargs=0 GenUses :call GenUses()

" hotkeys
noremap <C-PageDown> :Tbbn<CR>
noremap <C-PageUp>   :Tbbp<CR>
noremap <F10>        :call CleanClose()<CR>

noremap <F2> :w<CR>
noremap <F4> :NERDTreeToggle<CR>
noremap <F5> :call Run()<CR>
noremap <F9> :make<CR>

" hotkey for FuzzyFinder plugin
map <Leader>f :FufFile<CR>
map <Leader>b :FufBuffer<CR>

" hotkey for a.vim plugin
map <Leader>a :A<CR>

map <Leader>t <Esc>:%!stbx-mtask<CR>

nnoremap ; :

syntax enable

" status line format
" set rulerformat=%60(%f\ %m%)%=%12\(%l,%v%)\ %P
set laststatus=2

set nocp
filetype on
filetype plugin on
filetype plugin indent on

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
set noexpandtab
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

let g:ConqueTerm_SendVisKey = '<F8>'
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1

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
