" Read Local Settings {{{
let $LOCALVIM = expand('~/_local.vim')
if filereadable($LOCALVIM)
    source $LOCALVIM
endif
" }}}


" vim: fdm=marker
