" common/_vimrc_start
"
" includes settings at the top of the .vimrc_file
"
" 1. set nocompatible
" 2. read from ~/_local_pre.vim

" At Start {{{
set nocompatible

" Read Local Settings {{{
let $LOCALPRE = expand('~/_local_pre.vim')
if filereadable($LOCALPRE)
    source $LOCALPRE
endif
" }}}

" }}}

" vim: fdm=marker
