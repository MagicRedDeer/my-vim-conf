set nocompatible
" General Settings {{{
filetype on
syntax on
filetype plugin indent on
if has("win32")
    behave mswin
endif
" }}}

set guioptions-=m

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

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set textwidth=79
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

" move a line up or down
nnoremap - "tdd"tp
nnoremap _ "tddk"tP

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
set undofile
set history =1000         " remember more commands and search history
set undolevels =1000      " use many muchos levels of undo
set hidden

" Some display settings {{{
set ruler               " show the cursor position all the time
set nowrap              " Dont wrap from screen end
set number              " show display settings
set relativenumber
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set hlsearch            " highlighting matching search results
set list                " visualizing tabs, spaces, trails etc.
set listchars=tab:>.,trail:.,extends:#,nbsp:.,precedes:%

" guioptions
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

" Settings for split and Tabs {{{
set nosplitbelow
set equalalways
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
endif
"}}}
