" Custom AutoCommands {{{
augroup lang_settings
    autocmd!
    autocmd FileType python :call Set_Python_Settings()
    autocmd FileType html :call Set_ML_Settings()
    autocmd FileType javascript :call Set_JS_Settings()
    autocmd BufEnter,BufRead *.{mel,ma} :call Set_Mel_Settings()
    autocmd FileType vim :call Set_Vim_Settings()
    autocmd FileType yaml :call Set_YAML_Settings()
augroup END
augroup vimrcEx
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END
" }}}
