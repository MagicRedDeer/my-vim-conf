" common/mappings-general.vim

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

