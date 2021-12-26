local M = {}

M.install = function(use)
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }
end

M.configure = function()
    require("gitsigns").setup()
end

return M
