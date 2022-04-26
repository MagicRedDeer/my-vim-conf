local utils = require('nvim_utils')

local modules = {
    'nvim_plugins.dcc.vimya',
    'nvim_plugins.dcc.nukevim',
 }

return {
    install = function(use)
        utils.install_modules(modules, use)
    end,

    configure = function()
        utils.configure_modules(modules)
    end,
}
