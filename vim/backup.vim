" options below are taken from http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

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

" store swap files in a separate directory
set directory=~/.vim/swap
