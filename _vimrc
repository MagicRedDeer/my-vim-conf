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
set rtp+=~/.vim/bundle/vundle/
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
Bundle 'Tail-Bundle'
Bundle "Vimya"
" Settings for vimya {{{
let vimyaPort = 7720
nnoremap <leader>sm :py sendBufferToMaya ()<cr>
vnoremap <leader>sm :py sendBufferToMaya ()<cr>
nnoremap <leader>sb :py sendBufferToMaya (True)<cr>
vnoremap <leader>sb :py sendBufferToMaya (True)<cr>
" Map my own additions to the plugin
nnoremap <leader>vt :py resetVimyaTail()<cr>
nnoremap <leader>vl :py resetVimyaLog()<cr>
vnoremap <leader>vt :py resetVimyaTail()<cr>
vnoremap <leader>vl :py resetVimyaLog()<cr>
nnoremap <leader>vr :call tail#Refresh()<cr>
vnoremap <leader>vr :call tail#Refresh()<cr>
" }}}

Bundle 'bufexplorer.zip'
Bundle 'bufkill.vim'
Bundle 'YankRing.vim'
Bundle 'surround.vim'
Bundle 'snipMate'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'pyflakes.vim'
Bundle 'CompleteHelper'
Bundle 'CamelCaseComplete'
Bundle 'camelcasemotion'
Bundle 'a.vim'
Bundle 'c.vim'
Bundle 'TaskList.vim'
Bundle 'ack.vim'
Bundle 'win9xblueback.vim'
Bundle 'darkblack.vim'
Bundle 'oceanblack.vim'
Bundle 'pep8'
Bundle 'Gundo'
Bundle 'pytest.vim'
Bundle 'PyDiction'
let g:pydiction_location = '.vim/bundle/PyDiction/complete-dict' 

Bundle 'lepture/vim-velocity.git'
Bundle 'genutils'
Bundle 'multvals.vim'
Bundle 'greputils'

Bundle 'ivanov/vim-ipython'

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
colorscheme default
set guifont=Consolas:h10:cANSI
set guioptions-=m
set guioptions-=T
if has('gui_running')
	colorscheme desert
	if has('gui_gnome')
		set guifont=Monospace\ 8
        endif
endif
" }}}

" Show line numbers and disable wrapping by default{{{
set number
set nowrap
set shiftround
" when wrapping is enabled do wrap friendly scrolling
nnoremap j gj
nnoremap k gk
" }}}

" History and undo settings  {{{
set history =1000         " remember more commands and search history
set undolevels =1000      " use many muchos levels of undo
set hidden
" }}}


" Maps for switching windows {{{
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
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
  setlocal foldmethod&
  setlocal foldmarker&
  setlocal tabstop&
  setlocal expandtab
  setlocal softtabstop&
  setlocal shiftwidth&
  setlocal textwidth&
  setlocal autoindent
endfunction
" }}}
call Set_Default_Settings()
augroup lang_settings
	autocmd!
	autocmd BufNewFile,BufEnter *.{py} call Set_Python_Settings()
	autocmd BufNewFile,BufEnter *.{c,C,cpp,java,h,mel,php} call Set_C_Settings()
	autocmd BufLeave *.{c,C,cpp,java,h,py} call Set_Default_Settings()
augroup END
" }}}

" Change the default working directory {{{
let g:homedir = "D:\\talha.ahmed\\workspace\\vim-home"
command! GoHome execute 'cd ' . homedir
" }}}

" Settings for split {{{
set noequalalways
" }}}

" Editing behaviour {{{ 
" visualizing tab and space characters, lines that extend beyond the terminal
" by a # at the end 
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
" }}}

fun! RefreshAllBuffers()
  set noconfirm
  "!git pull
  bufdo e!
  set confirm
  syn on
endfun

nnoremap <leader>gr :call RefreshAllBuffers()<cr>

" Ideas from LVSTHW @ steve losh {{{
" echom ">^.^<"

" Delete a line in insert mode
inoremap <c-d> <esc>ddi

" move a line up or down
nnoremap - ddp
nnoremap _ ddkP

" edit and source my vimrc file 
nnoremap <leader>ev :rightbelow vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" }}}
