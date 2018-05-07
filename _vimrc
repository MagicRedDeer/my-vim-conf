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

    setlocal tabstop=4
    setlocal expandtab
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

" {{{
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

" }}}


" Custom commands {{{
" convert text to pdf and view in vim
let g:homedir = "~/vim-home"
if has("win32")
    let g:homedir = "D:\\talha.ahmed\\workspace\\vim-home"
endif
command! GoHome execute 'cd ' . homedir


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
    autocmd FileType python :call Set_Python_Settings()
    autocmd FileType html :call Set_ML_Settings()
    autocmd FileType javascript :call Set_JS_Settings()
    autocmd BufEnter,BufRead *.{mel,ma} :call Set_Mel_Settings()
    autocmd FileType vim :call Set_Vim_Settings()
    autocmd FileType yaml :call Set_YAML_Settings()
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

cmap <C-V>      <C-R>+
cmap <S-Insert>     <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.
" Use CTRL-G u to have CTRL-Z only undo the paste.

exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

imap <S-Insert>     <C-V>
vmap <S-Insert>     <C-V>

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>       <C-V>

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>       :update<CR>
vnoremap <C-S>      <C-C>:update<CR>
inoremap <C-S>      <C-O>:update<CR>

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


" {{{ Plugins and Settings


" Vundle Settings {{{

let freshPlugInstall = 0
let vimfiles_dir = ".vim"
let bundles_dir = expand("~/" . vimfiles_dir . "/bundle")

let plugfile=expand("~/" . vimfiles_dir . "/autoload/plug.vim")
if !filereadable(plugfile)
    echo "Installing vim-plug.."
    echo ""

    let mkdir_flags = " -p "
    let link_cmd =  "silent !ln " .  EscapePath(expand(bundles_dir .  "/vim-plug/plug.vim")) . " " .  EscapePath(expand("~/" . vimfiles_dir  .  "/autoload/plug.vim"))
    if has('win32')
        let mkdir_flags = ""
        let link_cmd = "silent !mklink /h " .  EscapePath(expand("~/" .  vimfiles_dir  .  "/autoload/plug.vim")) . " " .  EscapePath(expand(bundles_dir .  "/vim-plug/plug.vim"))
    endif

    execute "silent !mkdir " . mkdir_flags . EscapePath(bundles_dir)
    execute "silent !git clone https://github.com/junegunn/vim-plug " . EscapePath(bundles_dir . "/vim-plug")
    execute "silent !mkdir " . mkdir_flags . EscapePath(expand("~/" . vimfiles_dir . "/autoload"))
    execute link_cmd
    execute "silent source " . EscapePath(expand("~/" . vimfiles_dir . "/autoload/plug.vim"), '')

    let freshPlugInstall = 1
endif

set nocompatible
filetype off
execute "silent source " . EscapePath(expand("~/" . vimfiles_dir . "/autoload/plug.vim"), '')

call plug#begin(bundles_dir)

Plug 'junegunn/vim-plug'

" My Plugs go here

" tag list plugin {{{
Plug 'majutsushi/tagbar'
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
Plug 'vim-scripts/Tail-Bundle'
let g:Tail_Height = 15
Plug 'https://bitbucket.org/goeb/vimya'

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
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'http://repo.or.cz/vcscommand.git'
Plug 'easymotion/vim-easymotion'
Plug 'rstacruz/sparkup'
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim',  { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  let python3_host_prog='c:\Program Files\Python35\python.exe'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
if has('win64')
    Plug 'Shougo/vimproc.vim', {'do': 'make -f make_mingw64.mak'}
else
    Plug 'Shougo/vimproc.vim', {'do': 'make'}
endif
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install tern' }
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'
let g:deoplete#sources#jedi#server_timeout = 30
let g:deoplete#sources#jedi#show_docstring = 1
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neomru.vim'

" extended % matching for HTML, LATEX etc.
Plug 'vim-scripts/matchit.zip'

" automatically timestamp files
Plug 'vim-scripts/timestamp.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

set laststatus=1
if has('gui_running')
    let g:airline_theme='ubaryd'
else
    let g:airline_theme='jellybeans'
endif
Plug 'vim-scripts/Gundo'
Plug 'vim-scripts/CompleteHelper'
Plug 'vim-scripts/CamelCaseComplete'
Plug 'ervandew/supertab'
" Super Tab settings {{{
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"
    let g:SuperTabMappingTabLiteral = '<c-tab>'
" }}}
Plug 'bkad/CamelCaseMotion'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/a.vim'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/genutils'
Plug 'vim-scripts/multvals.vim'
" Retired plugins {{{
"Plug 'YankRing.vim' "nice feature but it slows large deleting and yanking
"Plug 'Shougo/neocomplete' " Let go in favour of deoplete (nvim and vim8)
"}}}
"}}}

" apache velocity highlighting and stuff {{{
Plug 'lepture/vim-velocity'
"}}}

" some color schemes {{{
Plug 'vim-scripts/win9xblueback.vim'
Plug 'vim-scripts/darkblack.vim'
Plug 'vim-scripts/oceanblack.vim'
Plug 'altercation/vim-colors-solarized'
"}}}

" c, c# and c++ {{{
Plug 'vim-scripts/c.vim'
Plug 'Rip-Rip/clang_complete'
Plug 'OmniSharp/omnisharp-vim'
"{{{
if has('win32')
    let g:clang_library_path='C:\Program Files\LLVM\bin'
else
    let g:clang_library_path='/usr/lib/x86_64-linux-gnu/'
endif
"}}}
"}}}

" shells and stuff {{{
Plug 'talha81/Conque-Shell'
let g:ConqueTerm_CWInsert = 0
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_Color = 0
let g:ConqueTerm_ColorMode = ''
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CloseOnEnd = 0
let g:ConqueTerm_ReadUnfocused = 0
"}}}

" Adding Support for octave and matlab {{{

" Adding support for octave from http://wiki.octave.org/Vim {{{
Plug 'vim-scripts/octave.vim'
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
Plug 'vim-scripts/mlint.vim'
if has('win32')
    let mlint_hover = 0
endif
Plug 'elmanuelito/vim-matlab-behave'
augroup matlab
    autocmd!
    autocmd FileType octave setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
augroup END
" }}}

" }}}

" snipmate plugins {{{
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
"Plug 'julienXX/snipmate-snippets'
let g:UltiSnipsSnippetDir=expand('~/' . vimfiles_dir . '/UltiSnips')
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsUsePythonVersion = 2
let g:snips_author = "Talha Ahmed"
let g:snips_email  = "talha.ahmed@gmail.com"
let g:snips_github = "github.com/talha81"
""" }}}

"{{{ Linting management
if has('nvim') || version >= 800
    Plug 'w0rp/ale'
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
else
    Plug 'scrooloose/syntastic'
    "{{{ syntastic settings
    if has('win32')
        let $PATH='C:\Python27\Scripts;' . $PATH
        let $PATH='C:\Program Files\nodejs\node_modules\.bin;' . $PATH
    endif
    let g:syntastic_python_checkers = ['pyflakes', 'pylint']
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_php_checkers = ['php', 'phpcs']
    let g:syntastic_check_on_wq = 0
    let g:syntastic_echo_current_error = 1
    let g:syntastic_warning_symbol = 'w>'
    let g:syntastic_enable_balloons = 1
    let g:syntastic_always_populate_loc_list = 1
    syn match pythonEscape  "\\['\"]"
    "}}}
end
"}}}


Plug 'davidhalter/jedi-vim'
" Jedi vim settings {{{
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#auto_close_doc = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 0
let g:jedi#force_py_version = 2
if has('win32')
    let $PYTHONPATH='C:\Program Files\Autodesk\Maya2016\devkit\other\pymel\extras\completion\py;' . $PYTHONPATH
    let $PYTHONPATH='C:\Program Files\Nuke9.0v4\pythonextensions\site-packages;' . $PYTHONPATH
    let $PYTHONPATH='D:\talha.ahmed\workspace\pyenv_common\southpaw-tactic\src\client;' . $PYTHONPATH
    let $PYTHONPATH='D:\talha.ahmed\workspace\pyenv_common\southpaw-tactic\src;' . $PYTHONPATH
    let $PYTHONPATH='D:\talha.ahmed\workspace\pyenv_maya;' . $PYTHONPATH
    let $PYTHONPATH='D:\talha.ahmed\workspace\pyenv_maya\tactic;' . $PYTHONPATH
    let $PYTHONPATH='C:\Program Files\Nuke9.0v4\plugins;' . $PYTHONPATH
    let $PYTHONPATH='C:\Program Files (x86)\Google\google_appengine\lib;' . $PYTHONPATH
    let $PYTHONPATH='C:\Program Files (x86)\Google\google_appengine;' . $PYTHONPATH
    let $PYTHONPATH='C:\Program Files (x86)\Google\google_appengine\lib\webapp2-2.5.2;' . $PYTHONPATH
endif
Plug 'tmhedberg/SimpylFold'


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

Plug 'joonty/vdebug'

Plug 'mattn/calendar-vim'
"Plug 'itchyny/calendar.vim'
Plug 'tpope/vim-repeat'

if !exists("g:speeddating_no_mappings") || !g:speeddating_no_mappings
  nmap  <M-u>     <Plug>SpeedDatingUp
  nmap  <M-d>     <Plug>SpeedDatingDown
  xmap  <M-u>     <Plug>SpeedDatingUp
  xmap  <M-d>     <Plug>SpeedDatingDown
  nmap d<M-u>     <Plug>SpeedDatingNowUTC
  nmap d<M-d>     <Plug>SpeedDatingNowLocal
  let g:speeddating_no_mappings = 1
endif
Plug 'tpope/vim-speeddating'


Plug 'jceb/vim-orgmode'
let g:org_todo_keywords = ['TODO', 'RUNNING', 'TESTING', 'SUPERVISING', 'REOPENED', '|', 'DONE', 'DELEGATED', 'CANCELLED']
let g:org_agenda_files = ['~/diary/**/**/*.md']

Plug 'godlygeek/tabular'

" documentation and spread sheets {{{
Plug 'Rykka/os.vim'
"Plug 'clickable.vim'
Plug 'Rykka/riv.vim'
Plug 'chrisbra/csv.vim'
Plug 'vim-scripts/VisIncr'
" {{{ markdown support
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
" }}}
" }}}

Plug 'tpope/vim-unimpaired'

Plug 'cohama/lexima.vim'
let g:lexima_enable_basic_rules = 1
let g:lexima_enable_newline_rules = 0
let g:lexima_enable_endwise_rules = 0

"Plug 'pep8'
"Plug 'Pydiction'
"let g:pydiction_location = '.vim/bundle/PyDiction/complete-dict'

"For HTML {{{
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'valloric/MatchTagAlways'
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx': 1
    \}
Plug 'skammer/vim-css-color'
"}}}

" javascript specific {{{
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
if has('win32')
    let $PATH='C:\Program Files\nodejs\;' . $PATH
    let $PATH='C:\Program Files\nodejs\node_modules\.bin;' . $PATH
endif
Plug 'ternjs/tern_for_vim', { 'do': 'npm install tern' }
" }}}

" PHP things {{{
Plug 'StanAngeloff/php.vim'
" php.vim syntax override {{{
function! PhpSyntaxOverride()
    hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction
augroup phpSyntaxOverride
    autocmd!
    autocmd FileType php call PhpSyntaxOverride()
augroup END
"}}}

Plug 'docteurklein/php-getter-setter.vim'
" php getter setter both mapping{{{
augroup phpsetter
    autocmd!
    autocmd FileType php nnoremap <buffer> <leader>pb <Plug>PhpgetsetInsertBothGetterSetter
    autocmd FileType php nnoremap <buffer> <leader>ps <Plug>PhpgetsetInsertSetter
    autocmd FileType php nnoremap <buffer> <leader>pg <Plug>PhpgetsetInsertGetter
augroup end
"}}}

Plug 'shawncplus/phpcomplete.vim'
let g:phpcomplete_parse_docblock_comments=1
let g:phpcomplete_cache_taglists=1
let g:phpcomplete_complete_for_unknown_classes=1
Plug 'swekaj/php-foldexpr.vim'
Plug 'vim-php/vim-php-refactoring'
let g:php_refactor_command='refactor'
Plug 'vim-php/tagbar-phpctags.vim'
let g:tagbar_phpctags_bin='phpctags'
Plug 'vim-php/vim-create'
Plug 'vim-php/vim-composer'
let g:composer_cmd = 'composer'

Plug 'wdalmut/vim-phpunit'
if has('nvim')
    Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
endif

Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
let g:pdv_template_dir = bundles_dir . "/pdv/templates_snip"
augroup pdv_config
    autocmd!
    autocmd FileType php nnoremap <buffer> <leader>d :call pdv#DocumentWithSnip()<CR>
augroup end

Plug 'tyru/open-browser.vim'
Plug 'dsawardekar/wordpress.vim'

"}}}

Plug 'vim-scripts/EasyGrep'

" Settings for Easy Grep {{{
let EasyGrepWindow = 0
let EasyGrepMode = 1

" }}}

" Session management {{{
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
let g:session_directory = expand('~/' . vimfiles_dir . '/sessions')
let g:session_autosave = 'no'
Plug 'mhinz/vim-startify'
let g:startify_session_dir= g:session_directory
" }}}

let $LPLUG = expand('~/_local_plug.vim')
if filereadable($LPLUG)
    source $LPLUG
endif

call plug#end()

" CamelCaseMotion Settings {{{
call camelcasemotion#CreateMotionMappings('<leader>')
"}}}

""
" Brief help
" :PlugList          - list configured bundles
" :PlugInstall(!)    - install(update) bundles
" :PlugSearch(!) foo - search(or refresh cache first) for foo
" :PlugClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plug command a ',',re not allowed..
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
set backupdir =$temp
set undofile
set undodir =$temp
set history =1000         " remember more commands and search history
set undolevels =1000      " use many muchos levels of undo
set hidden
set visualbell
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
colorscheme desert 
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
elseif has('win32')
    colorscheme slate
endif
" }}}

" }}}


" Settings for split and Tabs {{{
set nosplitbelow
set equalalways
set path+=**
set wildmenu
set complete-=u
" }}}


"Columns and lines{{{
if has('gui_running')
    set columns=999
    set lines=999
    set colorcolumn=80
else
    augroup nonGuiCommands
        autocmd!
        autocmd InsertLeave,InsertEnter * set cursorline!
    augroup END
endif
"}}}


"{{{ nvim specific settings
if has('nvim')
    :tnoremap <Esc><Esc> <C-\><C-n>
    :tnoremap <C-k> <C-\><C-n><C-w>k
    :tnoremap <C-l> <C-\><C-n><C-w>l
    :tnoremap <C-h> <C-\><C-n><C-w>h
    :tnoremap <C-j> <C-\><C-n><C-w>j
    :tnoremap <C-w> <C-\><C-n><C-w>
    augroup terminalau
        autocmd!
        autocmd BufEnter term://* startinsert
    augroup end
    call deoplete#enable()
endif

"}}}


" {{{ Installation and Local Settings
if ( freshPlugInstall == 1)
    execute 'PlugInstall'
endif

let $LOCALVIM = expand('~/_local.vim')
if filereadable($LOCALVIM)
    source $LOCALVIM
endif
"}}}


" }}}
