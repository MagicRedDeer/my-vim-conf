package.loaded['nvim_utils'] = nil
local utils = require 'nvim_utils'

local modules = {
    'nvim_settings',
    'nvim_display_settings',
    'nvim_mappings',
    'nvim_plugins',
}

utils.remove_modules(modules)
utils.require_modules(modules)

-- vim: foldmethod=marker foldmarker={{{,}}}
