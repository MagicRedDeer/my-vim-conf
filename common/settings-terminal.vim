" common/settings-terminal.vim

" {{{ terminal specific settings
if has('nvim') || version >= 800
    :tnoremap <Esc><Esc> <C-\><C-n>
    :tnoremap <C-k> <C-\><C-n><C-w>k
    :tnoremap <C-l> <C-\><C-n><C-w>l
    :tnoremap <C-h> <C-\><C-n><C-w>h
    :tnoremap <C-j> <C-\><C-n><C-w>j
    :tnoremap <C-w> <C-\><C-n><C-w>
    if !has('nvim')
        set termwinkey=<M-y>
        :tnoremap <M-v> <M-y>"
        :tnoremap <C-b> <M-y>"*
        :tnoremap <C-v> <M-y>""
    endif
    augroup terminalau
        autocmd!
        autocmd BufEnter term://* startinsert
    augroup end
endif
" }}}

