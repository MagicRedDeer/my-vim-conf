vim.cmd [[colorscheme desert]]

-- for resetting {{{
modules = {
    'nvim_utils',
    'nvim_settings',
    'nvim_terminal_settings',
    'nvim_display_settings'
}
local remove_modules = function() 
    for _, module in ipairs(modules) do
        package.loaded[module] = nil
    end
end
remove_modules(modules)
-- }}}

local utils = require 'nvim_utils'
require 'nvim_settings'
require 'nvim_terminal_settings'
require 'nvim_display_settings'

-- vim: foldmethod=marker foldmarker={{{,}}}
