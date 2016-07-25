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
