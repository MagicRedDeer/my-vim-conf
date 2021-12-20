local module = {}


module.install = function(use)
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }
end


module.configure = function()
    require('gitsigns').setup()
end


return module
