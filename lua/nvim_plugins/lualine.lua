local M = {}

M.install = function(use)
    use {
        "nvim-lualine/lualine.nvim",
        requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
end

M.configure = function()
    require "lualine".setup(
        {
            theme = "gruvbox"
        }
    )
end

return M
