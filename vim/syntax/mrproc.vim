" Vim syntax file
" Language:	mrproc
" Maintainer:	Ilya Strukov <iley@iley.ru>
" Last Change:	2011 Sep 14

if exists("b:current_syntax")
  finish
endif

" Read the shell syntax to start with
runtime! syntax/sh.vim
unlet b:current_syntax

let b:current_syntax = "mrproc"
