local module = {}


vim.g.dashboard_default_executive = 'telescope'


module.install = function(use)
   use 'glepnir/dashboard-nvim'
end


module.configure = function()
end


return module
