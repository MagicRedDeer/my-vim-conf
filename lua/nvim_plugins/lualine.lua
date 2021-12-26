local module = {}

module.install = function(use)
    use {'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
end

module.configure = function ()
    require'lualine'.setup({
        theme = 'gruvbox'
    })
end

return module
