
function! myspacevim#before() abort
  set shellxquote=
  let g:virtualenv_directory='C:\Users\talha.ahmed\Envs'
  let g:session_directory = '~/.vimsessions'
  let g:session_autosave = 'no'
  if has('win32')
    let g:python_host_prog = 'c:\python27\python.exe'
    let g:python3_host_prog = 'c:\python39\python.exe'
  end
endfunction

function! myspacevim#after() abort
  
  " Settings for vimya {{{
  let g:vimyaTailAvailable = 1
  let g:Tail_Height = 15
  let g:vimyaPort = 7720
  let g:vimyaTailCommand = 'STail'
  let g:vimyaSplitBelow = 1
  let g:vimyaForceRefresh = 1
  let g:vimyaRefreshWait = 1.0

  nnoremap <leader>mr :py vimyaRefreshLog<cr>
  nnoremap <leader>mt :py vimyaOpenLog<cr>
  nnoremap <leader>ml :py vimyaResetLog<cr>
  nnoremap <leader>mw :VimyaWhatIs <cr>
  nnoremap <leader>mu :VimyaSend undo()<cr>
  nnoremap <leader>mU :VimyaSend redo()<cr>
  nnoremap <leader>mm :py vimyaRun ()<cr>
  vnoremap <leader>mm :py vimyaRun ()<cr>
  nnoremap <leader>mb :py vimyaRun (forceBuffer = True)<cr>
  vnoremap <leader>mb :py vimyaRun (forceBuffer = True)<cr>
  " }}}
endfunction
