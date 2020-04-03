" common/settings-guioptions.vim
"
" Clean vim gui

" Setting gui options and fonts {{{
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R
set guioptions-=e
set guioptions+=c
if !has("unix")
  set guioptions-=a
endif
" }}}

" vim: foldmethod=marker

