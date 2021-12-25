local cmp_configure = require "nvim_plugin_settings.lsp.cmp"
local null_ls_configure = require "nvim_plugin_settings.lsp.null_ls"
local lspsaga_configure = require "nvim_plugin_settings.lsp.lspsaga"
local signs_configure = require "nvim_plugin_settings.lsp.signs"
local servers_configure = require "nvim_plugin_settings.lsp.servers"

return function()
    cmp_configure()
    null_ls_configure()
    lspsaga_configure()
    signs_configure()
    servers_configure()
end
