return {
    install = function(use)
        use "morhetz/gruvbox"
        use "rakr/vim-one"
        use "ayu-theme/ayu-vim"
    end,
    configure = function()
        vim.o.background = "dark"
        vim.o.termguicolors = true
        vim.g.ayucolor="mirage"   -- "mirage", light", "dark"
        vim.cmd [[colorscheme ayu]]
    end
}
