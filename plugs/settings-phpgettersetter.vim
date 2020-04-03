
" php getter setter both mapping{{{
augroup phpsetter
    autocmd!
    autocmd FileType php nnoremap <buffer> <leader>pb <Plug>PhpgetsetInsertBothGetterSetter
    autocmd FileType php nnoremap <buffer> <leader>ps <Plug>PhpgetsetInsertSetter
    autocmd FileType php nnoremap <buffer> <leader>pg <Plug>PhpgetsetInsertGetter
augroup end
"}}}
