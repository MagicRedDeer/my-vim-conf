local M = {}

local utils = require("nvim_utils")

local modules = {
    "nvim_plugins.startup.sessions",
    "nvim_plugins.startup.alpha",
}

utils.remove_modules(modules)

M.install = function(use)
    utils.install_modules(modules, use)
end

M.configure = function()
    utils.configure_modules(modules)
end

return M
