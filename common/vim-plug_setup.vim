" common/vim-plug_setup.vim

" Setup VimPlug {{{

set nocompatible
filetype off
execute "silent source " . EscapePath(g:plugfile, '')

call plug#begin(bundles_dir)

Plug 'junegunn/vim-plug'

"}}}

" vim: fdm=marker
