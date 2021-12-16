require 'nvim_utils'.install_packer()

plugins = {
	 'nvim_plugin_settings/which_key',
     'nvim_plugin_settings/treesitter',
     'nvim_plugin_settings/lualine',
     'nvim_plugin_settings/nerdtree',
     'nvim_plugin_settings/autopair',
     'nvim_plugin_settings/telescope',
}
require 'nvim_utils'.remove_modules(plugins)


vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use 'tpope/vim-surround'
   use 'morhetz/gruvbox'

   for _, module in ipairs(plugins) do
        require(module).install(use)
   end
end)

-- now configure all modules with settings
for _, module in ipairs(plugins) do
    require(module).configure()
end
