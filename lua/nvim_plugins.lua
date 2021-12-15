require 'nvim_utils'.install_packer()

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use 'tpope/vim-surround'
end
)
