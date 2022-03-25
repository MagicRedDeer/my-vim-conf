" common/settings-encoding
" 
" Encoding Settings. These settings don't make any sense after some patches but
" they work fine so lets leave them here
"

" Encoding settings {{{
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
" }}}

" vim: foldmethod=marker
