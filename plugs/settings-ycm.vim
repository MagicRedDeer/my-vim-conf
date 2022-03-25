
" YCM Settings {{{
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_use_clangd = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_always_populate_location_list = 0
if has('nvim')
    let g:ycm_add_preview_to_completeopt = 0
else
    let g:ycm_add_preview_to_completeopt = 1
end
let g:ycm_autoclose_preview_window_after_insertion=1

" let g:ycm_key_invoke_completion = '<c-Tab>'
let g:ycm_key_list_select_completion = ['<tab>', '<up>']
"let g:ycm_key_list_previous_completion = ['<s-tab>']
"
let g:ycm_extra_conf_globlist = ['~/rdev/cpp/*']

" Disable for latex
let g:ycm_filetype_blacklist = {
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'text' : 1,
      \ 'tex' : 1,
      \}
" YCM mappings {{{
nmap <leader>yy :YcmForceCompileAndDiagnostics<cr>
nmap <leader>yg :YcmCompleter GoToDefinitionElseDeclaration<cr>
nmap <leader>yd :YcmCompleter GetDoc<cr>
nmap <leader>yc :YcmCompleter GoToDeclaration<cr>
nmap <leader>yt :YcmCompleter GetType<cr>
nmap <leader>yr :YcmCompleter GoToReferences<cr>
nmap <leader>yp :YcmCompleter GoToParent<cr>
nmap <leader>yf :YcmCompleter FixIt
" }}}
" }}}
