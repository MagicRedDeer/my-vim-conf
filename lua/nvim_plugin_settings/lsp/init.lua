vim.o.completeopt = "menu,menuone,noselect,noinsert"

local modules = {
    "nvim_plugin_settings/lsp/maps",
    "nvim_plugin_settings/lsp/install",
    "nvim_plugin_settings/lsp/configure"
}
require "nvim_utils".remove_modules(modules)

local module = {}

module.maps = require "nvim_plugin_settings/lsp/maps"
module.install = require "nvim_plugin_settings/lsp/install"
module.configure = require "nvim_plugin_settings/lsp/configure"

return module
