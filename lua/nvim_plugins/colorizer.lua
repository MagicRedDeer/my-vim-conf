local M = {}

M.install = function(use)
    use "norcalli/nvim-colorizer.lua"
end

M.configure = function()
    require "colorizer".setup()
end

return M
