vim.cmd [[colorscheme desert]]

-- for resetting {{{
modules = {
    'nvim_utils'
}
local remove_modules = function() 
    for _, module in ipairs(modules) do
        package.loaded[module] = nil
    end
end
remove_modules(modules)
-- }}}

local utils = require 'nvim_utils'

-- vim: foldmethod=marker foldmarker={{{,}}}
