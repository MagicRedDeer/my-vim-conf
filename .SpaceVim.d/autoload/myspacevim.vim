" Settings functions {{{

function s:searchSettings() "{{{
  set ignorecase
  set smartcase
endfunction
"  }}}

function s:sessionSettings() " {{{
  let g:session_autoload = 'no'
  let g:session_directory = '~/.vimsessions'
  let g:session_autosave = 'no'
endfunction
" }}}

function s:windowsOSSpecificSettings() "{{{
  if has('win32')
    set shellxquote=
    let g:virtualenv#directory = 'C:\Users\talha.ahmed\Envs'
    let g:python_host_prog = 'c:\python27\python.exe'
    let g:python3_host_prog = 'c:\python39\python.exe'
  endif
endfunction

" }}}

function s:mayaSettings() "{{{
  " Settings for vimya {{{
  let g:vimyaTailAvailable = 1
  let g:Tail_Height = 15
  let g:vimyaPort = 7720
  let g:vimyaTailCommand = 'STail'
  let g:vimyaSplitBelow = 1
  let g:vimyaForceRefresh = 1
  let g:vimyaRefreshWait = 1.0

  nnoremap <leader>mr :py vimyaRefreshLog()<cr>
  nnoremap <leader>mt :py vimyaOpenLog()<cr>
  nnoremap <leader>ml :py vimyaResetLog()<cr>
  nnoremap <leader>mw :VimyaWhatIs <cr>
  nnoremap <leader>mu :VimyaSend undo()<cr>
  nnoremap <leader>mU :VimyaSend redo()<cr>
  nnoremap <leader>mm :py vimyaRun ()<cr>
  vnoremap <leader>mm :py vimyaRun ()<cr>
  nnoremap <leader>mb :py vimyaRun (forceBuffer = True)<cr>
  vnoremap <leader>mb :py vimyaRun (forceBuffer = True)<cr>
  " }}}
endfunction
" }}}

function s:windowSettings() "{{{
  augroup terminal_cmds
    autocmd!
    autocmd BufEnter term://* setl winfixheight
  augroup END

  :tnoremap <C-[> <Esc>
  :tnoremap <C-[> <C-\><C-n>
  :tnoremap <S-Esc> <C-\><C-n>
  :tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  :tnoremap <C-h> <C-\><C-N><C-w>h
  :tnoremap <C-j> <C-\><C-N><C-w>j
  :tnoremap <C-k> <C-\><C-N><C-w>k
  :tnoremap <C-l> <C-\><C-N><C-w>l
  :inoremap <C-h> <C-\><C-N><C-w>h
  :inoremap <C-j> <C-\><C-N><C-w>j
  :inoremap <C-k> <C-\><C-N><C-w>k
  :inoremap <C-l> <C-\><C-N><C-w>l
  :nnoremap <C-h> <C-w>h
  :nnoremap <C-j> <C-w>j
  :nnoremap <C-k> <C-w>k
  :nnoremap <C-l> <C-w>l
endfunction
" }}}

" }}}

" autoload functions {{{

function! myspacevim#before() abort " {{{
  call s:sessionSettings() 
  call s:searchSettings()
  call s:windowsOSSpecificSettings()
  call s:windowSettings()
endfunction
" }}}

function! myspacevim#after() abort "{{{
  call s:mayaSettings()
endfunction
" }}}

" }}}

" vim: fdm=marker fmr={{{,}}} sw=2 et ts=2 sts=2 foldlevelstart=99
