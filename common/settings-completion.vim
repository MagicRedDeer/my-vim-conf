" common/settings-completion.vim

" Completion Settings {{{
set complete-=u,t
set complete+=k
set complete+=kspell
set completeopt=menu,menuone,longest
set complete=.,w,b,i,k,t,U,u,s
if has('nvim')
    set completeopt-=preview
    let g:float_preview#docked=0
endif
let g:omnicomplete_fetch_documentation=1
" }}}

