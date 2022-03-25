" common/download_vim-plug.vim
"
" Code for downloading vim plug using git

" Download VimPlug {{{
let g:freshPlugInstall = 0
let g:vimfiles_dir = ".vim"
let g:bundles_dir = expand("~/" . g:vimfiles_dir . "/bundle")

let g:plugfile=expand("~/" . g:vimfiles_dir . "/autoload/plug.vim")
if !filereadable(g:plugfile)
    echo "Installing vim-plug.."
    echo ""

    let mkdir_flags = " -p "
    let link_cmd =  "silent !ln " .  EscapePath(expand(g:bundles_dir .  "/vim-plug/plug.vim")) . " " .  EscapePath(expand("~/" . vimfiles_dir  .  "/autoload/plug.vim"))
    if has('win32')
        let mkdir_flags = ""
        let link_cmd = "silent !mklink /h " .  EscapePath(expand("~/" .  g:vimfiles_dir  .  "/autoload/plug.vim")) . " " .  EscapePath(expand(g:bundles_dir .  "/vim-plug/plug.vim"))
    endif

    execute "silent !mkdir " . mkdir_flags . EscapePath(g:bundles_dir)
    execute "silent !git clone https://github.com/junegunn/vim-plug " . EscapePath(g:bundles_dir . "/vim-plug")
    execute "silent !mkdir " . mkdir_flags . EscapePath(expand("~/" . g:vimfiles_dir . "/autoload"))
    execute link_cmd
    execute "silent source " . EscapePath(expand("~/" . g:vimfiles_dir . "/autoload/plug.vim"), '')

    let g:freshPlugInstall = 1
endif
" }}}

" vim: fdm=marker
