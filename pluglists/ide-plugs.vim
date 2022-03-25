"""""""""""""""
"  IDE Plugs  "
"""""""""""""""

" IDE Plugs {{{
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'Konfekt/FastFold'
if has('nvim')
    Plug 'ncm2/float-preview.nvim'
end

" C/C++ {{{
Plug 'derekwyatt/vim-fswitch'
Plug 'derekwyatt/vim-protodef'
Plug 'rhysd/vim-clang-format'
" }}}

" For Python {{{
Plug 'tmhedberg/SimpylFold'
Plug 'davidhalter/jedi-vim'
" }}}

" For GLSL {{{
Plug 'tikhomirov/vim-glsl'
" }}}

"For SQL {{{
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-dadbod'
Plug 'vim-scripts/SQLUtilities'
Plug 'jonathanfilip/vim-dbext'
" }}}

"For HTML {{{
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'valloric/MatchTagAlways'
Plug 'skammer/vim-css-color'
"}}}

" javascript specific {{{
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install tern' }
" }}}

" C# and Unity {{{
Plug 'OmniSharp/omnisharp-vim'
Plug 'OrangeT/vim-csharp'
" }}}

" Debugging {{{
Plug 'joonty/vdebug'
" }}}

" PHP things {{{
Plug 'StanAngeloff/php.vim'
Plug 'docteurklein/php-getter-setter.vim'
Plug 'shawncplus/phpcomplete.vim'
Plug 'swekaj/php-foldexpr.vim'
Plug 'vim-php/vim-php-refactoring'
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'vim-php/vim-create'
Plug 'vim-php/vim-composer'
Plug 'wdalmut/vim-phpunit'
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'
Plug 'dsawardekar/wordpress.vim'
"}}}

" Session Management {{{
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'mhinz/vim-startify'
" }}}

" AutoClose and Jumping {{{
Plug 'vim-scripts/matchit.zip'
Plug 'cohama/lexima.vim'
" }}}

" Browser and Web {{{
Plug 'vim-scripts/WebAPI.vim'
Plug 'tyru/open-browser.vim'
" }}}

" Maya Integration {{{
Plug 'vim-scripts/Tail-Bundle'
Plug 'https://gitlab.com/LazyLeopard/vimya.git'
" }}}

" }}}

