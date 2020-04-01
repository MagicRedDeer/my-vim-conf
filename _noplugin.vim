set nocompatible

" General Settings {{{
filetype on
syntax on
filetype plugin indent on
if has("win32")
    behave mswin
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
" }}}

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

if has('gui_running')
    color desert
else
    color murphy
endif

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set textwidth=78
set autoindent

set shiftround

set path+=**

" when wrapping is enabled do wrap friendly scrolling
nnoremap j gj
nnoremap k gk

" Maps for switching windows 
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

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

" Use CTRL-S for saving, also in Insert mode
noremap <C-S>       :update<CR>
vnoremap <C-S>      <C-C>:update<CR>
inoremap <C-S>      <C-O>:update<CR>


" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set backup
set backupdir=$temp
if has('unix')
    set backupdir =~/.backup/
    execute "silent !mkdir -p " . EscapePath(expand("~/.backup"))
endif
set noswapfile
set undofile
set undodir =$temp
if has('unix')
    set undodir =~/.undo/
    execute "silent !mkdir -p " . EscapePath(expand("~/.undo"))
endif
set history =1000         " remember more commands and search history
set undolevels =1000      " use many muchos levels of undo
set hidden

" Some display settings {{{
set ruler               " show the cursor position all the time
set nowrap              " Dont wrap from screen end
set nonumber              " show display settings
set relativenumber
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch            " highlighting matching search results
set ignorecase
set smartcase
set incsearch
set list                " visualizing tabs, spaces, trails etc.
set listchars=tab:>.,trail:.,extends:#,nbsp:.,precedes:%
set laststatus=2
set formatoptions-=t
set viewoptions=cursor,options,folds,slash,unix

" guioptions {{{
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
" }}}

" Settings for split and Tabs {{{
set nosplitbelow
set equalalways
" }}}

" Default options for folding {{{
set foldenable
set foldmethod=syntax
set foldlevel=100       " Unfold on start
set foldopen=block,hor,mark,percent,quickfix,tag
set foldlevelstart=99
" }}}

" Behaviour Settings {{{
set visualbell
if has('virtualedit')
    set virtualedit=all
endif
set hidden
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

"{{{ terminal settings
if has('nvim') || version >= 800
    :tnoremap <Esc><Esc> <C-\><C-n>
    :tnoremap <C-k> <C-\><C-n><C-w>k
    :tnoremap <C-l> <C-\><C-n><C-w>l
    :tnoremap <C-h> <C-\><C-n><C-w>h
    :tnoremap <C-j> <C-\><C-n><C-w>j
    :tnoremap <C-w> <C-\><C-n><C-w>
    if !has('nvim')
        set termwinkey=<M-y>
        :tnoremap <M-v> <M-y>"
        :tnoremap <C-b> <M-y>"*
        :tnoremap <C-v> <M-y>""
    endif
    augroup terminalau
        autocmd!
        autocmd BufEnter term://* startinsert
    augroup end
endif
"}}}

" Completion Settings {{{
set complete+=k
set complete+=kspell
set completeopt=menu,menuone,longest
let g:omnicomplete_fetch_documentation=1
" }}}


" Wild Menu Settings {{{
set wildmenu
set wildmode=full
set wildignore=*.o,*.obj,*~
set wildcharm=<Tab>
" }}}

" Commands {{{
command! -nargs=+ FixIndent call IndentationFixer(<f-args>)
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Mappings                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{

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

" move visual block up/down one
vmap <c-j> "td"tp'[V']
vmap <c-k> "tdk"tP'[V']

" move a line up or down
nnoremap - "tdd"tp
nnoremap _ "tddk"tP

" move stuff to the right of cursor to next line
nmap <silent> <leader><CR> i<CR><ESC>k$

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

" Indentation changes, but visual stays
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" }}}
" vim: fdm=marker
