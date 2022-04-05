vim.api.nvim_exec([[
augroup trailingWS
    autocmd!
    autocmd BufWritePre *.bat %s/\s\+$//e
    autocmd BufWritePre *.cfg %s/\s\+$//e
    autocmd BufWritePre *.conf %s/\s\+$//e
    autocmd BufWritePre *.cpp %s/\s\+$//e
    autocmd BufWritePre *.css %s/\s\+$//e
    autocmd BufWritePre *.h %s/\s\+$//e
    autocmd BufWritePre *.hpp %s/\s\+$//e
    autocmd BufWritePre *.html %s/\s\+$//e
    autocmd BufWritePre *.ini %s/\s\+$//e
    autocmd BufWritePre *.js %s/\s\+$//e
    autocmd BufWritePre *.jsx %s/\s\+$//e
    autocmd BufWritePre *.mako %s/\s\+$//e
    autocmd BufWritePre *.md %s/\s\+$//e
    autocmd BufWritePre *.mel %s/\s\+$//e
    autocmd BufWritePre *.pro %s/\s\+$//e
    autocmd BufWritePre *.ps1 %s/\s\+$//e
    autocmd BufWritePre *.py %s/\s\+$//e
    autocmd BufWritePre *.reg %s/\s\+$//e
    autocmd BufWritePre *.sh %s/\s\+$//e
    autocmd BufWritePre *.shelf %s/\s\+$//e
    autocmd BufWritePre *.txt %s/\s\+$//e
    autocmd BufWritePre *.ui %s/\s\+$//e
    autocmd BufWritePre *.xml %s/\s\+$//e
    autocmd BufWritePre *.yml %s/\s\+$//e
augroup END
]], true)
