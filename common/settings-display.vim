" common/settings-display.vim

" Some display settings {{{
set ruler               " show the cursor position all the time
set nowrap              " Dont wrap from screen end
set nonumber            " show display settings
set showcmd             " display incomplete commands
set list                " visualizing tabs, spaces, trails etc.
set listchars=tab:>.,trail:.,extends:#,nbsp:.,precedes:%,eol:~
set nofixendofline
set laststatus=2
set noshowmode     " Mode is in airline, no need stock one
set formatoptions-=t " Don't wrap while typing
set viewoptions=cursor,options,folds,slash,unix
set shortmess +=c

" Settings for split and Tabs {{{
set nosplitbelow
set equalalways
" }}}

" Behaviour Settings {{{
set visualbell
set hidden
" }}}

"Columns and lines{{{
if has('gui_running')
    if has('win32')
        simalt ~x
    else
        simalt <F10>
    endif
else
    augroup nonGuiCommands
        autocmd!
        autocmd InsertLeave,InsertEnter * set cursorline!
    augroup END
endif
"}}}

" }}}

" vim: fdm=marker
