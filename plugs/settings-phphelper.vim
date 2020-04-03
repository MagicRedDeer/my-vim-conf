
" PHP Helper Settings {{{
let g:php_refactor_command='refactor'
let g:tagbar_phpctags_bin='phpctags'
let g:composer_cmd = 'composer'

let g:pdv_template_dir = bundles_dir . "/pdv/templates_snip"
augroup pdv_config
    autocmd!
    autocmd FileType php nnoremap <buffer> <leader>d :call pdv#DocumentWithSnip()<CR>
augroup end

" }}}
