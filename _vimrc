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
Plugin 'gmarik/vundle'

" My Plugins should go here

" Maps for switching buffers {{{
nmap <M-j> :bn<Enter>
nmap <M-k> :bp<Enter>
"}}}

" tag list plugin {{{
Plugin 'majutsushi/tagbar'
let g:tagbar_type_mel = {
    \ 'ctagstype' : 'mel',
    \ 'kinds' : [
        \ 'g:global procedures:0:1',
        \ 'l:procedures:0:1',
        \ 's:var string:1',
        \ 'i:var integer:1',
        \ 'f:var float:1',
        \ 's:var string:1',
        \ 'v:var vector:1'
        \ ]
    \ }
" }}}

" sending buffer contents to maya {{{
Plugin 'Tail-Bundle'
let g:Tail_Height = 15
Plugin 'https://bitbucket.org/goeb/vimya' , {'name': 'vimya', 'pinned':1}

" Settings for vimya {{{
let vimyaPort = 7720
let vimyaTailCommand = 'STail'
let vimyaSplitBelow = 1
let vimyaRefreshWait = 2.0
nnoremap <leader>sr :py vimyaRefreshLog ()<cr>
nnoremap <leader>st :py vimyaOpenLog ()<cr>
nnoremap <leader>sl :py vimyaResetLog ()<cr>
vnoremap <leader>sr :py vimyaRefreshLog ()<cr>
vnoremap <leader>st :py vimyaOpenLog ()<cr>
vnoremap <leader>sl :py vimyaResetLog ()<cr>
" }}}
" }}}

" Use full editor and IDE addons {{{
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup'
Plugin 'L9'
Plugin 'FuzzyFinder'

" extended % matching for HTML, LATEX etc.
Plugin 'matchit.zip'

" automatically timestamp files
Plugin 'timestamp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mattdbridges/bufkill.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
set laststatus=1
let g:airline_theme='ubaryd'
Plugin 'Gundo'
Plugin 'TaskList.vim'
Plugin 'CompleteHelper'
Plugin 'CamelCaseComplete'
Plugin 'ervandew/supertab'
" Super Tab settings {{{
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"
    let g:SuperTabMappingTabLiteral = '<c-tab>'
" }}}
Plugin 'bkad/CamelCaseMotion'
Plugin 'tpope/vim-surround'
Plugin 'a.vim'
Plugin 'mileszs/ack.vim'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'genutils'
Plugin 'multvals.vim'
" Retired plugins {{{
"Plugin 'YankRing.vim' "nice feature but it slows large deleting and yanking
"}}}
"}}}

" apache velocity highlighting and stuff {{{
Plugin 'lepture/vim-velocity.git'
"}}}

" some color schemes {{{
Plugin 'win9xblueback.vim'
Plugin 'darkblack.vim'
Plugin 'oceanblack.vim'
"}}}

" c and c++ {{{
Plugin 'c.vim'
"}}}

" shells and stuff {{{
"Plugin 'Conque-Shell'
Plugin 'talha81/Conque-Shell'
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_Color = 1
let g:ConquerTerm_ColorMode = ''
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_ReadUnfocused = 1
"Plugin 'ivanov/vim-ipython'
"Plugin 'johndgiese/vipy'
"}}}

" snipmate plugins {{{
Plugin 'SirVer/ultisnips'
"Plugin 'julienXX/snipmate-snippets'
Plugin 'honza/vim-snippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsUsePythonVersion = 2
let g:snips_author = "Talha Ahmed"
let g:snips_email  = "talha.ahmed@gmail.com"
let g:snips_github = "github.com/talha81"

Plugin 'scrooloose/syntastic'
"{{{ syntastic settings
if has('win32')
    let $PATH='C:\Python27\Scripts;' . $PATH
endif
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_check_on_wq = 0
let g:syntastic_echo_current_error = 1
let g:syntastic_warning_symbol = 'w>'
let g:syntastic_enable_balloons = 1
let g:syntastic_always_populate_loc_list = 1
"}}}


Plugin 'davidhalter/jedi-vim'
" Jedi vim settings {{{
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#auto_close_doc = 0
let g:jed#popup_on_dot = 0
if has('win32')
    let $PYTHONPATH='C:\Program Files\Autodesk\Maya2013\devkit\other\pymel\extras\completion\py;' . $PYTHONPATH
    let $PYTHONPATH='C:\Python26\Lib\site-packages;' . $PYTHONPATH
endif

" for custom mappings on jedi vim {{{
function! g:Splitandgoto()
        :rightbelow vsp
        :call jedi#goto_assignments()
endfunction
function! g:Splitandgetdefinition()
        :rightbelow vsp
        :call jedi#goto_definitions()
endfunction
function! g:Map_jedi_settings()
    nnoremap <buffer> <leader>D :call g:Splitandgetdefinition()<cr>
    nnoremap <buffer> <leader>G :call g:Splitandgoto()<cr>
endfunction
augroup custom_jedi_mappings
    autocmd!
    autocmd BufNewFile,BufEnter *.{py,pyw} :call g:Map_jedi_settings()
augroup END
"}}}
"}}}

Plugin 'mattn/calendar-vim'
"Plugin 'itchyny/calendar.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'

if !exists("g:speeddating_no_mappings") || !g:speeddating_no_mappings
  nmap  <C-U>     <Plug>SpeedDatingUp
  nmap  <C-D>     <Plug>SpeedDatingDown
  xmap  <C-U>     <Plug>SpeedDatingUp
  xmap  <C-D>     <Plug>SpeedDatingDown
  nmap d<C-U>     <Plug>SpeedDatingNowUTC
  nmap d<C-D>     <Plug>SpeedDatingNowLocal
endif

Plugin 'jceb/vim-orgmode'
let g:org_todo_keywords = ['TODO', 'RUNNING', 'TESTING', 'SUPERVISING', 'REOPENED', '|', 'DONE', 'DELEGATED', 'CANCELLED']
let g:org_agenda_files = ['~/diary/**/**/*.md']

Plugin 'tpope/vim-unimpaired'


"Plugin 'pep8'
"Plugin 'Pydiction'
"let g:pydiction_location = '.vim/bundle/PyDiction/complete-dict'
" }}}
" }}}

Plugin 'EasyGrep'
" Settings for Easy Grep {{{
let EasyGrepWindow = 0
let EasyGrepMode = 1
" }}}

""
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command a ',',re not allowed..
" }}}

" }}}

" Setting gui font {{{
colorscheme default
set guifont=Consolas:h8:cANSI
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=r
set guioptions-=L
set guioptions-=R
set guioptions-=e
set guioptions+=c
if has('gui_running')
    colorscheme desert
    if has('gui_gnome')
        set guifont=Monospace\ 8
    endif
elseif !has('win32')
    colorscheme darkblue
endif
" }}}

" Show line numbers and disable wrapping by default{{{
"set number
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

" Vim Fold and indent Settings {{{
function! Set_Vim_Settings()
    " code folding settings
    setlocal foldmethod=marker
    setlocal foldmarker={{{,}}}

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
    autocmd BufNewFile,BufEnter *.{py,pyw} :call Set_Python_Settings()
    autocmd BufNewFile,BufEnter *.{c,C,cpp,java,h,mel,php} :call Set_C_Settings()
    autocmd BufNewFile,BufEnter *.vim :call Set_Vim_Settings()
    autocmd BufNewFile,BufEnter $MYVIMRC :call Set_Vim_Settings()
    autocmd BufLeave *.{c,C,cpp,java,h,py,pyw,vim} :call Set_Default_Settings()
augroup END
" }}}

" Change the default working directory {{{
let g:homedir = "D:\\talha.ahmed\\workspace\\vim-home"
command! GoHome execute 'cd ' . homedir
" }}}

" Settings for split {{{
set noequalalways
" }}}

" encoding settings {{{
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
" }}}

" Editing behaviour {{{
" visualizing tab and space characters, lines that extend beyond the terminal
" by a # at the end
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.,precedes:%
" }}}

" Code for refreshing all buffers (esp. for after checkout or pull) {{{

function! RefreshCurrentBuffer()
    let k = &l:buftype
    if k==''
        execute 'e!'
    endif
endfun

fun! RefreshAllBuffers()
    let bn = bufnr('%')
    set noconfirm
    bufdo call RefreshCurrentBuffer()
    set confirm
    execute 'b ' . bn
    syn on
endfun

nnoremap <leader>rb :call RefreshAllBuffers()<cr>
"}}}

" {{{
" move a line up or down
nnoremap - ddp
nnoremap _ ddkP

" edit and source my vimrc file
nnoremap <leader>ev :rightbelow vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
" }}}
