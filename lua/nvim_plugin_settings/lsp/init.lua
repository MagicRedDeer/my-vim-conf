utils = require("nvim_utils")

vim.o.completeopt = "menu,menuone,noselect,noinsert"

local modules = {
    "nvim_plugin_settings.lsp.cmp",
    "nvim_plugin_settings.lsp.lspsaga",
    "nvim_plugin_settings.lsp.null_ls"
}
utils.remove_modules(modules)

local module = {}

module.install = function(use)
    utils.install_modules(modules, use)
end

module.configure = function()
    utils.configure_modules(modules)
end

return module
