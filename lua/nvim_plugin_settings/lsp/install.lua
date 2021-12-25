local install = function(use)
    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use "onsails/lspkind-nvim"

    use "tami5/lspsaga.nvim"
    use "jose-elias-alvarez/null-ls.nvim"
    use "williamboman/nvim-lsp-installer"
end

return install
