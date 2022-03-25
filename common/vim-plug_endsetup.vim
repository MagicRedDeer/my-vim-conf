" common/vim-plug_endsetup.vim
"
" read local plugs
" call plug#end and PlugInstall if required

" End VimPlug {{{

let $LPLUG = expand('~/_local_plug.vim')
if filereadable($LPLUG)
    source $LPLUG
endif

call plug#end()

if ( g:freshPlugInstall == 1)
    execute 'PlugInstall'
endif

" }}}

" vim: fdm=marker
