return {
    install = function(use)
        use "morhetz/gruvbox"
        use "rakr/vim-one"
        use "ayu-theme/ayu-vim"
        use "marko-cerovac/material.nvim"
    end,
    configure = function()
        vim.o.background = "dark"
        vim.o.termguicolors = true
        vim.g.ayucolor="mirage"   -- "mirage", light", "dark"
        vim.g.material_style = "deep ocean" --"deep ocean", "oceanic", "palenight", "lighter", "darker"
        vim.cmd 'colorscheme material'
    end
}
