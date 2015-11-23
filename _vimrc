" must be at start
set nocompatible


" Encoding settings {{{
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


" Custom Functions {{{
" filetype dependent indent and folding settings {{{
function! Set_Python_Settings()
    " code folding settings
    setlocal foldmethod=indent

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
    " code folding settings
    setlocal foldmethod=marker
    setlocal foldmarker={{{,}}}

    setlocal tabstop=4
    setlocal noexpandtab
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

    setlocal tabstop=4
    setlocal noexpandtab
    setlocal softtabstop=4
    setlocal shiftwidth=4
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

" Code for refreshing all buffers (esp. for after checkout or pull) {{{
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

" Assigning diff expression for GNU diff utils {{{
if has('win32')
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
    let diff = '"C:\Program Files (x86)\GnuWin32\bin\diff.exe"'
    if &sh =~ '\<cmd'
      silent execute '!' . diff . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . ''
    else
      silent execute '!'. diff .' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
    endif
  endfunction
endif
"}}}

" }}}


" Custom commands {{{
" convert text to pdf and view in vim
let g:homedir = "~/vim-home"
if has("win32")
    let g:homedir = "D:\\talha.ahmed\\workspace\\vim-home"
    command! GoHome execute 'cd ' . homedir
endif


command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

function! PythonIndentationFixer(from, tonum)
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

command! -nargs=+ PyFixIndent call PythonIndentationFixer(<f-args>)
" }}}


" Custom AutoCommands {{{
augroup lang_settings
    autocmd!
    autocmd BufNewFile,BufEnter *.{py,pyw} :call Set_Python_Settings()
    autocmd BufNewFile,BufEnter *.{htm,html,xhtml,xml} :call Set_ML_Settings()
    autocmd BufNewFile,BufEnter *.{js,jsx} :call Set_JS_Settings()
    autocmd BufNewFile,BufEnter *.{mel,ma} :call Set_Mel_Settings()
    autocmd BufNewFile,BufEnter *.vim :call Set_Vim_Settings()
    autocmd BufNewFile,BufEnter $MYVIMRC :call Set_Vim_Settings()
augroup END
augroup vimrcEx
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END
" }}}


" Custom Maps {{{

" Don't use Ex mode, use Q for formatting
noremap Q gq

" Edit and source my vimrc file
nnoremap <leader>ev :rightbelow vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" when wrapping is enabled do wrap friendly scrolling
nnoremap j gj
nnoremap k gk

" Maps for switching windows 
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" Map for refreshing all open buffers
nnoremap <leader>rb :call RefreshAllBuffers()<cr>

" move a line up or down
nnoremap - "tdd"tp
nnoremap _ "tddk"tP

" Maps for switching buffers
nnoremap <M-j> :bn<Enter>
nnoremap <M-k> :bp<Enter>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" from mswin.vim {{{
" backspace in Visual mode deletes selection
vnoremap <BS> d

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>               "+gP
map <S-Insert>          "+gP

cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

imap <S-Insert>		<C-V>
vmap <S-Insert>		<C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

" Alt-Space is System menu
if has('gui_running')
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>
endif

" CTRL-Tab is Next window
noremap <C-Tab> <C-W>w
inoremap <C-Tab> <C-O><C-W>w
cnoremap <C-Tab> <C-C><C-W>w
onoremap <C-Tab> <C-C><C-W>w

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c
" }}}

" Meta-A is Select all
noremap <M-a> gggH<C-O>G
inoremap <M-a> <C-O>gg<C-O>gH<C-O>G
cnoremap <M-a> <C-C>gggH<C-O>G
onoremap <M-a> <C-C>gggH<C-O>G
snoremap <M-a> <C-C>gggH<C-O>G
xnoremap <M-a> <C-C>ggVG
" }}}


" Vundle Settings {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let vundle manage vundle
Plugin 'gmarik/vundle'

" My Plugins should go here

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
Plugin 'https://bitbucket.org/goeb/vimya'

" Settings for vimya {{{
let vimyaPort = 7720
let vimyaTailCommand = 'STail'
let vimyaSplitBelow = 1
let vimyaForceRefresh = 1
let vimyaRefreshWait = 2.0
nnoremap <leader>sr :py vimyaRefreshLog ()<cr>
nnoremap <leader>st :py vimyaOpenLog ()<cr>
nnoremap <leader>sl :py vimyaResetLog ()<cr>
vnoremap <leader>sr :py vimyaRefreshLog ()<cr>
vnoremap <leader>st :py vimyaOpenLog ()<cr>
vnoremap <leader>sl :py vimyaResetLog ()<cr>
vnoremap <leader>su :VimyaSend undo()<cr>
vnoremap <leader>sU :VimyaSend redo()<cr>
" }}}
" }}}

" Use full editor and IDE addons {{{
Plugin 'tpope/vim-fugitive'
Plugin 'http://repo.or.cz/vcscommand.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup'
Plugin 'L9'
Plugin 'FuzzyFinder'

" extended % matching for HTML, LATEX etc.
Plugin 'matchit.zip'

" automatically timestamp files
Plugin 'timestamp.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'qpkorr/vim-bufkill'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'

set laststatus=1
if has('gui_running')
    let g:airline_theme='ubaryd'
else
    let g:airline_theme='jellybeans'
endif
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
let g:ConqueTerm_CWInsert = 0
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_Color = 0
let g:ConqueTerm_ColorMode = ''
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CloseOnEnd = 0
let g:ConqueTerm_ReadUnfocused = 0
"Plugin 'ivanov/vim-ipython'
"Plugin 'johndgiese/vipy'
"}}}

" Adding Support for octave and matlab {{{

" Adding support for octave from http://wiki.octave.org/Vim {{{
Plugin 'octave.vim'
augroup octaveautocommands
    au!
    au! BufRead,BufNewFile *.oct set filetype=octave
    if exists("+omnifunc")
    " Use keywords from Octave syntax language file for autocomplete
    autocmd Filetype octave
    \ if &omnifunc == "" |
    \ setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
    endif 
    autocmd FileType octave setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
    autocmd FileType octave map <buffer> <f5> ggOpkg load all<esc>Gopause<esc>:w<cr>:!octave -qf %<cr>ddggdd:w<cr>
    " extending matchit functionality
    let s:conditionalEnd = '\(([^()]*\)\@!\<end\>\([^()]*)\)\@!'
    autocmd FileType octave let b:match_words = '\<if\>\|\<while\>\|\<for\>\|\<switch\>:' .
        \ s:conditionalEnd . ',\<if\>:\<elseif\>:\<else\>:' . s:conditionalEnd
augroup END
" }}}

" Adding support for matlab{{{
Plugin 'mlint.vim'
if has('win32')
    let mlint_hover = 0
endif
Plugin 'elmanuelito/vim-matlab-behave'
augroup matlab
    autocmd!
    autocmd FileType octave setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
augroup END
" }}}

" }}}

" snipmate plugins {{{
Plugin 'SirVer/ultisnips'
"Plugin 'julienXX/snipmate-snippets'
Plugin 'honza/vim-snippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsUsePythonVersion = 2
let g:snips_author = "Talha Ahmed"
let g:snips_email  = "talha.ahmed@gmail.com"
let g:snips_github = "github.com/talha81"
""" }}}

Plugin 'scrooloose/syntastic'
"{{{ syntastic settings
if has('win32')
    let $PATH='C:\Python27\Scripts;' . $PATH
    let $PATH='C:\Program Files\nodejs\node_modules\.bin;' . $PATH
endif
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_javascript_checkers = ['jshint']
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
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
if has('win32')
    let $PYTHONPATH='C:\Program Files\Autodesk\Maya2015\devkit\other\pymel\extras\completion\py;' . $PYTHONPATH
    let $PYTHONPATH='C:\Program Files\Nuke9.0v4\pythonextensions\site-packages;' . $PYTHONPATH
    let $PYTHONPATH='C:\Python27\Lib\site-packages;' . $PYTHONPATH
    let $PYTHONPATH='D:\talha.ahmed\workspace\pyenv_common\southpaw-tactic\src\client;' . $PYTHONPATH
    let $PYTHONPATH='D:\talha.ahmed\workspace\pyenv_common\southpaw-tactic\src;' . $PYTHONPATH
    let $PYTHONPATH='D:\talha.ahmed\workspace\pyenv_maya;' . $PYTHONPATH
    let $PYTHONPATH='D:\talha.ahmed\workspace\pyenv_maya\tactic;' . $PYTHONPATH
    let $PYTHONPATH='C:\Program Files\Nuke9.0v4\plugins;' . $PYTHONPATH
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

Plugin 'joonty/vdebug.git'

Plugin 'mattn/calendar-vim'
"Plugin 'itchyny/calendar.vim'
Plugin 'tpope/vim-repeat'

if !exists("g:speeddating_no_mappings") || !g:speeddating_no_mappings
  nmap  <M-u>     <Plug>SpeedDatingUp
  nmap  <M-d>     <Plug>SpeedDatingDown
  xmap  <M-u>     <Plug>SpeedDatingUp
  xmap  <M-d>     <Plug>SpeedDatingDown
  nmap d<M-u>     <Plug>SpeedDatingNowUTC
  nmap d<M-d>     <Plug>SpeedDatingNowLocal
  let g:speeddating_no_mappings = 1
endif
Plugin 'tpope/vim-speeddating'


Plugin 'jceb/vim-orgmode'
let g:org_todo_keywords = ['TODO', 'RUNNING', 'TESTING', 'SUPERVISING', 'REOPENED', '|', 'DONE', 'DELEGATED', 'CANCELLED']
let g:org_agenda_files = ['~/diary/**/**/*.md']


" documentation and spread sheets {{{
Plugin 'Rykka/os.vim'
Plugin 'clickable.vim'
Plugin 'Rykka/riv.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'VisIncr'
" }}}

Plugin 'tpope/vim-unimpaired'

Plugin 'cohama/lexima.vim'

"Plugin 'pep8'
"Plugin 'Pydiction'
"let g:pydiction_location = '.vim/bundle/PyDiction/complete-dict'

" javascript specific {{{
Plugin 'pangloss/vim-javascript'
if has('win32')
    let $PATH='C:\Program Files\nodejs\;' . $PATH
    let $PATH='C:\Program Files\nodejs\node_mo;' . $PATH
endif
Plugin 'Shutnik/jshint2.vim'
let jshint2_read = 1
let jshint2_save = 1
let jshint2_close = 0
let jshint2_confirm = 0
" }}}

Plugin 'EasyGrep'
" Settings for Easy Grep {{{
let EasyGrepWindow = 0
let EasyGrepMode = 1

" }}}

" Session management {{{
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
let g:session_autosave = 'no'
Plugin 'mhinz/vim-startify'
let g:startify_session_dir = '~/vimfiles/sessions'
" }}}

Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'
Plugin 'skammer/vim-css-color'

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


" General Settings {{{
filetype on
syntax on
filetype plugin indent on
if has("win32")
    behave mswin
endif
" }}}


" Editing Options {{{

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Default options for indenting
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set textwidth=78
set autoindent
set shiftround

" Default options for folding
set foldmethod=manual
set foldlevelstart=99

" }}}


" History and undo settings  {{{
set backup
set undofile
set history =1000         " remember more commands and search history
set undolevels =1000      " use many muchos levels of undo
set hidden
" }}}


" Some display settings {{{
set ruler               " show the cursor position all the time
set nowrap              " Dont wrap from screen end
set nonumber            " show display settings
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch            " highlighting matching search results
set list                " visualizing tabs, spaces, trails etc.
set listchars=tab:>.,trail:.,extends:#,nbsp:.,precedes:%

" Setting gui options and fonts {{{
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
if !has("unix")
  set guioptions-=a
endif
if has('gui_running')
    colorscheme desert
    if has('gui_gnome')
        set guifont=Monospace\ 8
    endif
elseif !has('win32')
    colorscheme delek
else
    colorscheme elflord
endif
" }}}

" }}}


" Settings for split and Tabs {{{
set nosplitbelow
set equalalways
" }}}


" MODELINE {{{
" vim:tw=78:ts=8:sr:sw=4:sts=4:et:ft=vim:norl:fdm=marker:fmr&:
" }}}
