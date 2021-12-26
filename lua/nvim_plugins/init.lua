utils = require("nvim_utils")
utils.install_packer()

local modules = {
    "nvim_plugins/treesitter",
    "nvim_plugins/lualine",
    "nvim_plugins/nerdtree",
    "nvim_plugins/telescope",
    "nvim_plugins/autopair",
    "nvim_plugins/colorizer",
    "nvim_plugins/gitsigns",
    "nvim_plugins/startup",
    "nvim_plugins/indentguides",
    "nvim_plugins/formatting",
    "nvim_plugins/terminal",
    "nvim_plugins/comments",
    "nvim_plugins/lsp",
    "nvim_plugins/which_key"
}
utils.remove_modules(modules)

vim.cmd [[packadd packer.nvim]]

require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"
        use {
            "rakr/vim-one",
            config = function()
                vim.o.background = "dark"
                vim.cmd [[colorscheme one]]
            end
        }
        use "tpope/vim-surround"
        use "tpope/vim-repeat"
        use "tpope/vim-unimpaired"
        use "tpope/vim-fugitive"

        utils.install_modules(modules, use)
    end
)

-- now configure all modules with settings
utils.configure_modules(modules)
