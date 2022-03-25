local utils = require("nvim_utils")

vim.o.completeopt = "menu,menuone,noselect,noinsert"

local modules = {
    "nvim_plugins.lsp.cmp",
    "nvim_plugins.lsp.lsp_installer",
    "nvim_plugins.lsp.null_ls",
    "nvim_plugins.lsp.lspsaga",
}
utils.remove_modules(modules)

local M = {}

M.install = function(use)
    use "neovim/nvim-lspconfig"
    utils.install_modules(modules, use)
end

M.configure = function()
    utils.configure_modules(modules)
    require ('nvim_plugins.lsp.diagnostics')()
    require ('nvim_plugins.lsp.keymaps')()
end

return M
