local M = {}

M.install = function(use)
    use {
        "terrortylor/nvim-comment",
    }
end

M.configure = function()
    require("nvim_comment").setup()
end

return M
