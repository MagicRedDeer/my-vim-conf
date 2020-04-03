
" OmniSharp Settings {{{
let g:Omnisharp_start_server = 0
let g:Omnisharp_stop_server  = 0
let g:OmniSharp_host="http://localhost:20001"
let g:ycm_csharp_server_port = 20001
let g:OmniSharp_timeout = 1
let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'

let g:OmniSharp_selector_ui = "denite"

" OmniSharp bindings TODO: compare with Eugene's - CS only!
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
nnoremap <leader>fm :OmniSharpFindMembersInBuffer<cr>
nnoremap <leader><space> :OmniSharpFindMembersInBuffer<cr>

" cursor can be anywhere on the line containing an issue for this one
nnoremap <leader>x  :OmniSharpFixIssue<cr>
nnoremap <leader>fx :OmniSharpFixUsings<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>dc :OmniSharpDocumentation<cr>
nnoremap <leader>gd :OmniSharpGotoDefinition<cr>
" }}}
