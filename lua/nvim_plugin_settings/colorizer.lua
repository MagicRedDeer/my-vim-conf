local module = {}


module.install = function(use)
   use 'norcalli/nvim-colorizer.lua'
end


module.configure = function()
    require'colorizer'.setup()
end


return module
