
" Ale settings {{{
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0
let g:ali_lint_delay = 1000
let g:ale_linters = {
            \ 'php': ['phpmd', 'phpcs'],
            \ 'python': ['flake8'],
            \ 'javascript': ['eslint'],
            \ }
let g:ale_fixers = {
            \ 'python': ['autopep8', 'yapf'],
            \ 'javascript': ['eslint']
            \ }
let g:ale_php_phpmd_ruleset = 'cleancode'
" }}}

