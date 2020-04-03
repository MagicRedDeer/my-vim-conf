
" Settings for vimya {{{
let g:Tail_Height = 15
let vimyaPort = 7720
let vimyaTailCommand = 'STail'
let vimyaSplitBelow = 1
let vimyaForceRefresh = 1
let vimyaRefreshWait = 2.0
nnoremap <leader>mr :py vimyaRefreshLog ()<cr>
nnoremap <leader>mt :py vimyaOpenLog ()<cr>
nnoremap <leader>ml :py vimyaResetLog ()<cr>
nnoremap <leader>mw :VimyaWhatIs <cr>
nnoremap <leader>mu :VimyaSend undo()<cr>
nnoremap <leader>mU :VimyaSend redo()<cr>
" }}}
