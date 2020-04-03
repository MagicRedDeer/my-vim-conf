" common/settings-fold_indent.vim

" Default options for indenting {{{
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set textwidth=78
set autoindent
set shiftround
" }}}

" Default options for folding {{{
set foldenable
set foldmethod=syntax
set foldlevel=100       " Unfold on start
set foldopen=block,hor,mark,percent,quickfix,tag
set foldlevelstart=99
" }}}

" vim: foldmethod=marker
