require 'nvim_utils'.install_packer()

local modules = {
     'nvim_plugin_settings/treesitter',
     'nvim_plugin_settings/lualine',
     'nvim_plugin_settings/nerdtree',
     'nvim_plugin_settings/lsp',
     'nvim_plugin_settings/telescope',
     'nvim_plugin_settings/autopair',
     'nvim_plugin_settings/which_key',
     'nvim_plugin_settings/colorizer',
     'nvim_plugin_settings/gitsigns',
     'nvim_plugin_settings/dashboard',
     'nvim_plugin_settings/indentguides',
}
require 'nvim_utils'.remove_modules(modules)


vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use 'morhetz/gruvbox'
   use 'tpope/vim-surround'

   for _, module in ipairs(modules) do
        require(module).install(use)
   end
end)

-- now configure all modules with settings
for _, module in ipairs(modules) do
    require(module).configure()
end
