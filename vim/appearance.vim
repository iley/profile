" language settings
language en_US.UTF-8
language messages en_US.UTF-8
set fileencodings=utf-8,koi8-r,windows-1251,iso-8859-15

syntax on

" use more colors
set t_Co=256

function! HasColorscheme(name)
    let pat = 'colors/'.a:name.'.vim'
    return !empty(globpath(&rtp, pat))
endfunction

if HasColorscheme("solarized")
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
endif

" GUI settings
if has("gui_running")
    set guioptions-=T " do not show toolbar
    set guioptions-=t " do not show tearoffs in menu
    set guifont=PragmataPro\ 12
endif

set number
set title
set ruler
