utils = require("nvim_utils")

vim.o.completeopt = "menu,menuone,noselect,noinsert"

local modules = {
    "nvim_plugins.lsp.cmp",
    "nvim_plugins.lsp.lspsaga",
    "nvim_plugins.lsp.null_ls"
}
utils.remove_modules(modules)

local M = {}

M.install = function(use)
    utils.install_modules(modules, use)
end

M.configure = function()
    utils.configure_modules(modules)
end

return M
