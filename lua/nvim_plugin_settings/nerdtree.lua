local module = {}

map = vim.api.nvim_set_keymap
vim.g.NERDTreeLimitedSyntax = 1

module.install = function(use)
    use 'preservim/nerdtree'
    use 'Xuyuanp/nerdtree-git-plugin'
    use 'ryanoasis/vim-devicons'
    use 'tiagofumo/vim-nerdtree-syntax-highlight'
end

module.configure = function ()
    map('n', '<leader>ft', ':NERDTreeToggle<CR>', {noremap = true})
    map('n', '<leader>fd', ':NERDTreeFind<CR>', {noremap = true})
end

return module
