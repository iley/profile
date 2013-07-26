augroup filetype
    au! BufNewFile,BufRead *.asd              setfiletype lisp
    au! BufNewFile,BufRead *.clj              set filetype=clojure
    au! BufNewfile,BufRead Construct,Consfile set filetype=perl
    au! BufNewFile,BufRead *.cpp              setfiletype cpp11
    au! BufNewfile,BufRead *.ejs              set filetype=html
    au! BufNewFile,BufRead *.go               set filetype=go
    au! BufNewFile,BufRead *.i                set filetype=swig
    au! BufNewFile,BufRead *.md               setfiletype markdown
    au! BufNewFile,BufRead *.pasm             set filetype=parrot
    au! BufNewFile,BufRead *.pro              set filetype=prolog
    au! BufNewFile,BufRead *.rsl              set filetype=rsl
    au! BufNewFile,BufRead *.rules            setfiletype lisp
    au! BufNewFile,BufRead *.sql              setfiletype pgsql
    au! BufNewFile,BufRead *.tex,*.ltx        set filetype=tex
    au! BufNewFile,BufRead *.tt2              set filetype=tt2html
    au! BufNewFile,BufRead *.xslate           setfiletype xslate
augroup end
