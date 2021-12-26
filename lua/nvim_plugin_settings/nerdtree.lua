local module = {}

map = vim.api.nvim_set_keymap
vim.g.NERDTreeLimitedSyntax = 1

module.install = function(use)
    use "preservim/nerdtree"
    use "Xuyuanp/nerdtree-git-plugin"
    use "ryanoasis/vim-devicons"
    use "tiagofumo/vim-nerdtree-syntax-highlight"
    -- use "PhilRunninger/nerdtree-buffer-ops"
    use "PhilRunninger/nerdtree-visual-selection"
end

module.configure = function()
    map("n", "<leader>ft", ":NERDTreeToggle<CR>", {noremap = true})
    map("n", "<leader>fd", ":NERDTreeFind<CR>", {noremap = true})

    require("nvim_utils").update_which_key_maps {
        f = {
            name = "files",
            t = {name = "NERD Tree Toggle"},
            d = {name = "NERD Tree Find File"}
        }
    }
end

return module
