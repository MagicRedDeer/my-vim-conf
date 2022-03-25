" common/functions.vim
" 
" Contains some common functions
"
" 1. EscapePath(path, ...)
" 2. IndentationFixer 
" 3. BufferRefreshing
" 4. MyDiff
" 5. Indent and Fold Settings


" used for escaping path for use on command line {{{
function! EscapePath(path, ...)

    let win32 = 1

    if a:0 > 0 
        if a:1 != 'win32'
            let win32 = 0
        endif
    elseif !has('win32')
        let win32 = 0
    endif

    if win32
        return ('"' . a:path . '"')
    else
        return substitute(a:path, ' ', '\\ ', '')
    endif

endfunction
" }}}


" Increase or decrease space based indentation for the whole file {{{
function! IndentationFixer(from, tonum)
    let from = a:from+0
    let tonum = a:tonum+0

    let &l:sw=from
    let &l:sts=from
    let &l:ts=from
    let &l:et=0
    retab!

    let &l:sw=tonum
    let &l:sts=tonum
    let &l:ts=tonum
    let &l:et=1
    retab!
endfunction
" }}}


" Refreshing {{{
function! RefreshCurrentBuffer()
    let k = &l:buftype
    if k==''
        execute 'e!'
    endif
endfun

function! RefreshAllBuffers()
    let bn = bufnr('%')
    set noconfirm
    bufdo call RefreshCurrentBuffer()
    set confirm
    execute 'b ' . bn
    syn on
endfun
" }}}


" My Diff function can be used as diffexpr on win32 {{{
function! MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif

    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let diff = '"C:\Program Files (x86)\GnuWin32\bin\diff.exe"'

    if &sh =~ '\<cmd'
        silent execute '!' . diff . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . ''
    else
        silent execute '!'. diff .' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    endif
endfunction
" }}}


" filetype dependent indent and folding settings {{{

function! Set_YAML_Settings()
    setlocal foldignore=#

    setlocal tabstop=2
    setlocal expandtab
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal textwidth=79
    setlocal autoindent

    setlocal shiftround
endfunction

function! Set_Python_Settings()
    " code folding settings
    "setlocal foldmethod=indent
    "setlocal foldcolumn=1
    setlocal foldignore=

    "pep8 settings
    setlocal tabstop=4
    setlocal expandtab
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal textwidth=79
    setlocal autoindent

    setlocal shiftround
endfunction

function! Set_Vim_Settings()
    setlocal foldmethod=marker
    setlocal foldmarker={{{,}}}

    setlocal tabstop=4
    setlocal expandtab
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal textwidth=79
    setlocal autoindent
endfunction

function! Set_JS_Settings()
    " code folding settings
    setlocal foldmethod=marker
    setlocal foldmarker={,}

    setlocal tabstop=4
    setlocal expandtab
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal textwidth&
    setlocal autoindent
endfunction

function! Set_ML_Settings()
    " code folding settings
    "setlocal foldmethod=marker
    "setlocal foldmarker={,}

    setlocal tabstop=2
    setlocal noexpandtab
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal textwidth=0
    setlocal autoindent
endfunction

function! Set_Mel_Settings()
    " code folding settings
    setlocal foldmethod=marker
    setlocal foldmarker={,}

    setlocal tabstop=4
    setlocal noexpandtab
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal textwidth=79
    setlocal autoindent
endfunction
" }}}

" vim: fdm=marker
