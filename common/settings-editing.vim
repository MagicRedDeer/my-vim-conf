" common/settings-editing.vim

" Editing Options {{{

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set fixendofline
set whichwrap+=<,>,[,]
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
if has('virtualedit')
    set virtualedit=all
endif
" }}}

" vim: foldmethod=marker

