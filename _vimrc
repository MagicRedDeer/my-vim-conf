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

" small buffer explorer {{{
Bundle 'fholgado/minibufexpl.vim'
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
"}}}

" tag list plugin {{{
Bundle 'majutsushi/tagbar'

"" Taglist Settings {{{
"let Tlist_Use_Right_Window=1 " Make Tag list appear on the right side 
"let g:tagbar_left = 1
""}}}
"}}}

" sending buffer contents to maya {{{
Bundle 'Tail-Bundle'
Bundle "talha81/vimya"

" Settings for vimya {{{
let vimyaPort = 7720
nnoremap <leader>sm :py sendBufferToMaya ()<cr>
vnoremap <leader>sm :py sendBufferToMaya ()<cr>
nnoremap <leader>sb :py sendBufferToMaya (True)<cr>
vnoremap <leader>sb :py sendBufferToMaya (True)<cr>

"" Map my own additions to the plugin
nnoremap <leader>vt :py resetVimyaTail()<cr>
nnoremap <leader>vl :py resetVimyaLog()<cr>
vnoremap <leader>vt :py resetVimyaTail()<cr>
vnoremap <leader>vl :py resetVimyaLog()<cr>
nnoremap <leader>vr :call tail#Refresh()<cr>
vnoremap <leader>vr :call tail#Refresh()<cr>
"" }}}

"""}}}

" Use full editor and IDE addons {{{
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup'
Bundle 'L9'
Bundle 'FuzzyFinder'

" extended % matching for HTML, LATEX etc.
Bundle 'matchit.zip'

" automatically timestamp files
Bundle 'timestamp.vim'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'mattdbridges/bufkill.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/powerline'
Bundle 'Gundo'
Bundle 'TaskList.vim'
Bundle 'CompleteHelper'
Bundle 'CamelCaseComplete'
Bundle 'ervandew/supertab'
" Super Tab settings {{{
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"
    let g:SuperTabMappingTabLiteral = '<c-tab>'
" }}}
Bundle 'bkad/CamelCaseMotion'
Bundle 'tpope/vim-surround'
Bundle 'a.vim'
Bundle 'mileszs/ack.vim'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'genutils'
Bundle 'multvals.vim'
" Retired plugins {{{
"Bundle 'YankRing.vim' "nice feature but it slows large deleting and yanking
"}}}
"}}}

" apache velocity highlighting and stuff {{{
Bundle 'lepture/vim-velocity.git'
"}}}

" some color schemes {{{
Bundle 'win9xblueback.vim'
Bundle 'darkblack.vim'
Bundle 'oceanblack.vim'
"}}}

" c and c++ {{{
Bundle 'c.vim' 
"if has('win32')
    "Bundle 'https://bitbucket.org/Haroogan/vim-youcompleteme-for-windows.git'
"else
    "Bundle 'Valloric/YouCompleteMe'
"endif
"}}}

" shells and stuff {{{
"Bundle 'Conque-Shell'
Bundle 'talha81/Conque-Shell'
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_Color = 0
let g:ConquerTerm_ColorMode = ''
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CloseOnEnd = 1
let g:ConqueTerm_ReadUnfocused = 1
"Bundle 'ivanov/vim-ipython'
"Bundle 'johndgiese/vipy'
"}}}

" snipmate plugins {{{
Bundle 'SirVer/ultisnips'
Bundle 'julienXX/snipmate-snippets'
Bundle 'honza/vim-snippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "snipmate-snippets"]
let g:snips_author = "Talha Ahmed"
let g:snips_email  = "talha.ahmed@gmail.com"
let g:snips_github = "github.com/talha81"

" Retired snipmate plugins {{{
""" install snipmate dependancies 
""Bundle "MarcWeber/vim-addon-mw-utils"
""Bundle "tomtom/tlib_vim"
""" install other snipmate
""Bundle "garbas/vim-snipmate"
"}}}

"}}}

"my Python plugins {{{
"Bundle 'Python-mode-klen'
"let g:pymode_rope_guess_project=0
"let g:pymode_lint_cwindow=0
"let g:pymode_lint_mccabe_complexity=10
"let g:pymode_breakpoint=0
" Retiring other plugins in favour of python mode {{{
"Bundle 'pytest.vim'
"Bundle 'pydoc.vim'
"Bundle "sontek/rope-vim"
"let ropevim_vim_completion=1
"let ropevim_extended_complete=1
"let ropevim_enable_shortcuts=1

Bundle 'scrooloose/syntastic'
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


Bundle 'davidhalter/jedi-vim'
        " Jedi vim settings {{{
        let g:jedi#use_tabs_not_buffers = 0

        " for custom mappings on jedi vim {{{
        function! g:splitandgoto()
                :rightbelow vsp
                :call jedi#goto()
        endfunction
        function! g:splitandgetdefinition()
                :rightbelow vsp
                :call jedi#get_definition()
        endfunction
        function! g:map_jedi_settings()
            nnoremap <buffer> <leader>D :call g:splitandgetdefinition()<cr>
            nnoremap <buffer> <leader>G :call g:splitandgoto()<cr>
        endfunction
        augroup custom_jedi_mappings
            autocmd!
            autocmd BufNewFile,BufEnter *.{py,pyw} :call g:map_jedi_settings()
        augroup END
        "}}}
        "}}}

Bundle "mattn/calendar-vim"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-speeddating"

if !exists("g:speeddating_no_mappings") || !g:speeddating_no_mappings
  nmap  <C-U>     <Plug>SpeedDatingUp
  nmap  <C-D>     <Plug>SpeedDatingDown
  xmap  <C-U>     <Plug>SpeedDatingUp
  xmap  <C-D>     <Plug>SpeedDatingDown
  nmap d<C-U>     <Plug>SpeedDatingNowUTC
  nmap d<C-D>     <Plug>SpeedDatingNowLocal
endif

Bundle "jceb/vim-orgmode"
let g:org_todo_keywords = ['TODO', 'RUNNING', 'TESTING', 'SUPERVISING', 'REOPENED', '|', 'DONE', 'DELEGATED', 'CANCELLED']

Bundle "tpope/vim-unimpaired"


"Bundle 'pep8'
"Bundle 'Pydiction'
"let g:pydiction_location = '.vim/bundle/PyDiction/complete-dict' 
" }}}
" }}}

Bundle 'EasyGrep'
" Settings for Easy Grep {{{
let EasyGrepWindow = 0
let EasyGrepMode = 1
" }}}

""
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command a ',',re not allowed..
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

" Editing behaviour {{{ 
" visualizing tab and space characters, lines that extend beyond the terminal
" by a # at the end 
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.,precedes:%
" }}}

" Code for refreshing all buffers (esp. for after checkout or pull) {{{
fun! RefreshAllBuffers()
    set noconfirm
    "!git pull
    bufdo e!
    set confirm
    syn on
endfun

nnoremap <leader>rb :call RefreshAllBuffers()<cr>
"}}}

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

" Grep Operator case study "{{{

" creating the mappings
"nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
"vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>

"function! s:GrepOperator(type)
    "let saved_unnamed_register = @@

    "" for visual mode send the selected range
    "if a:type ==# 'v' || (a:type ==? 'v' && &grepprg ==# 'internal')
        "normal! `<v`>y
    "" for normal mode send the 'adjective'
    "elseif a:type ==# 'char'
        "normal! `[v`]y
    "else
        "return
    "endif

    "silent execute "grep! -R " . shellescape(@@) . " ."
    "copen

    "let @@ = saved_unnamed_register
"endfunction
" }}}
" }}}

command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78
