" Language settings.
language en_US.UTF-8
language messages en_US.UTF-8
set fileencodings=utf-8,koi8-r,windows-1251,iso-8859-15

set number
set title
set laststatus=2
set ruler
set wildmenu
set colorcolumn=80,100,120
set viminfo='0,:500,<0,@100,f0
set list listchars=tab:>\ ,trail:_,extends:>

" Use more colors.
set t_Co=256

" Fix background color erase (see https://sunaku.github.io/vim-256color-bce.html)
set t_ut=

function! HasColorscheme(name)
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction

if HasColorscheme("solarized8")
    set background=dark
    colorscheme solarized8
endif
