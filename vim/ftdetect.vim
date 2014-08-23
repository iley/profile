augroup filetype
    au! BufNewFile,BufRead *.asd              set filetype=lisp
    au! BufNewFile,BufRead *.clj              set filetype=clojure
    au! BufNewfile,BufRead Construct,Consfile set filetype=perl
    au! BufNewFile,BufRead *.cpp              set filetype=cpp11
    au! BufNewfile,BufRead *.ejs              set filetype=html
    au! BufNewFile,BufRead *.go               set filetype=go
    au! BufNewFile,BufRead *.i                set filetype=swig
    au! BufNewFile,BufRead *.md               set filetype=markdown
    au! BufNewFile,BufRead *.pasm             set filetype=parrot
    au! BufNewFile,BufRead *.pro              set filetype=prolog
    au! BufNewFile,BufRead *.rsl              set filetype=rsl
    au! BufNewFile,BufRead *.rules            set filetype=lisp
    au! BufNewFile,BufRead *.sql              set filetype=pgsql
    au! BufNewFile,BufRead *.tex,*.ltx        set filetype=tex
    au! BufNewFile,BufRead *.tt2              set filetype=tt2html
    au! BufNewFile,BufRead *.xslate           set filetype=xslate
augroup end
