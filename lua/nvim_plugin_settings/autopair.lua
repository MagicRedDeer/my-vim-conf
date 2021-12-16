local module = {}

module.install = function(use)
    use 'windwp/nvim-autopairs'
end

module.configure = function ()
    require('nvim-autopairs').setup{
        check_ts = true,
        map_cr = true,
    }
end

return module
