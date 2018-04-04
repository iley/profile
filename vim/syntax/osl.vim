" Vim syntax file
" Language: AID fusion platform meta language
" Maintainer: Ilya Strukov
" Latest Revision: 11 Jan 2018

if exists("b:current_syntax")
  finish
endif

syn keyword oslKeyword true false package namespace class interface struct enum property method event readonly const stored returns implements extends async import typedef abstract local
syn keyword oslType int int8 int16 int32 int64 uint8 uint16 uint32 uint64 microsecs_t timestamp_t bool char string float double float32 float64 buffer_t sequence
syn match   oslInlineComment "\/\/.*"
syn region  oslMultilineComment start="/\*"  end="\*/"
syn region  oslString start=+"+  skip=+\\\\\|\\"\|\\$+  end=+"\|$+

hi def link oslKeyword Keyword
hi def link oslType Type
hi def link oslInlineComment Comment
hi def link oslMultilineComment Comment
hi def link oslString String
