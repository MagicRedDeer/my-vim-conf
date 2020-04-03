" common/settings-histbackupundo.vim
"
" history, undo and backup settings.

" History and undo settings  {{{
set backup
set writebackup
set noswapfile
set backupdir =$temp
if has('unix')
    set backupdir =~/.backup/
    execute "silent !mkdir -p " . EscapePath(expand("~/.backup"))
endif
set undofile
set undodir =$temp
if has('unix')
    set undodir =~/.undo/
    execute "silent !mkdir -p " . EscapePath(expand("~/.undo"))
endif
set history =1000         " remember more commands and search history
set undolevels =1000      " use many muchos levels of undo
" }}}

