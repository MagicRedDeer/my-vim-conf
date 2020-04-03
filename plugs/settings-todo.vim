
" Todo Plugin Settings {{{
" todo.vim default highlight groups, feel free to override as wanted
hi link todotitle title
hi link todotitlemark normal
hi link todoitem special
hi link todoitemadditionaltext comment
hi link todoitemcheckbox identifier
hi link todoitemdone ignore
hi link todocomment comment

" define like this to enable explicit comments
" comments then start with //
let g:todoexplicitcommentsenabled = 1
" }}}
