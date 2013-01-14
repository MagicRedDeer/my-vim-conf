" Default General Settings {{{
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
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
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
" }}}

" Vundle Settings {{{
set nocompatible
filetype off 
set rtp+=~/vimfiles/bundle/vundle/
call vundle#rc()

" let vundle manage vundle 
Bundle 'gmarik/vundle'

" My Bundles should go here {{{
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup'

Bundle 'L9'
Bundle 'FuzzyFinder'

" extended % matching for HTML, LATEX etc.
Bundle 'matchit.zip'

" automatically timestamp files
Bundle 'timestamp.vim'

" small buffer explorer 
Bundle 'minibufexpl.vim'
" MiniBufExplorer Settings {{{
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" Maps for switching buffers {{{
nmap <M-j> :MBEbn<Enter>
nmap <M-k> :MBEbp<Enter>
" }}}
"}}}

" tag list plugin
Bundle 'taglist.vim'
" Taglist Settings {{{
let Tlist_Use_Right_Window=1 " Make Tag list appear on the right side 
"}}}

" sending buffer contents to maya
Bundle "Vimya"
" Settings for vimya {{{
let vimyaPort = 7720
nnoremap <leader>sm :py sendBufferToMaya ()<cr>
vnoremap <leader>sm :py sendBufferToMaya ()<cr>
nnoremap <leader>sb :py sendBufferToMaya (True)<cr>
vnoremap <leader>sb :py sendBufferToMaya (True)<cr>
" }}}


"
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
" }}}

" }}}

" Setting gui font {{{ 
colorscheme darkblue
set guifont=Consolas:h10:cANSI
" }}}

" Show line numbers and disable wrapping by default{{{
set number
set nowrap
" }}}

" Maps for switching windows {{{
map <c-j> <c-w>j
map <c-h> <c-w>h
map <c-k> <c-w>k
map <c-l> <c-w>l
" }}}

" Syntax and Highlighting Setting "{{{
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
"}}}

" Fold and indent Settings " {{{ 
filetype plugin indent on 

" Python Fold and indent Settings {{{
function! Set_Python_Settings()
  " code folding settings 
  setlocal foldmethod=indent

  "pep8 settings 
  setlocal tabstop=8
  setlocal expandtab
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal textwidth=79
  setlocal autoindent
endfunction
" }}}
" C fold and indent Setting {{{
function! Set_C_Settings()
  " fold settings 
  setlocal foldmethod=syntax
  setlocal foldmarker={,}

  "pep8 settings 
  setlocal tabstop=8
  setlocal expandtab
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal textwidth=999
  setlocal autoindent
endfunction
" }}}
" Default fold and indent Settings {{{
function! Set_Default_Settings()
  " fold settings 
  setlocal foldmethod=marker
  setlocal foldmarker={{{,}}}
  
  "pep8 settings 
  setlocal tabstop=8
  setlocal expandtab
  setlocal softtabstop=4
  setlocal shiftwidth=4
  setlocal textwidth=999
  setlocal autoindent
endfunction
" }}}
call Set_Default_Settings()
autocmd BufNewFile,BufEnter *.{py} call Set_Python_Settings()
autocmd BufNewFile,BufEnter *.{c,C,cpp,java,h,mel,php} call Set_C_Settings()
autocmd BufLeave *.{c,C,cpp,java,h,py} call Set_Default_Settings()
" }}}

" Change the default working directory {{{
let g:homedir = "D:\\talha.ahmed\\workspace\\vim-home"
" }}}

" Settings for split {{{
set noequalalways
" }}}

