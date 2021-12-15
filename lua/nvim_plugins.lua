require 'nvim_utils'.install_packer()

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use 'tpope/vim-surround'
   use 'folke/which-key.nvim'
end)

modules = {
	 'nvim_plugin_settings/which_key'
}

require 'nvim_utils'.remove_modules(modules)

for _, module in ipairs(modules) do
	require(module)
end
