
" Read Local PlugSettings {{{
let $LOCALPLUGSETTINGS = expand('~/_local_plug_settings.vim')
if filereadable($LOCALPLUGSETTINGS)
    source $LOCALPLUGSETTINGS
endif 
" }}}
