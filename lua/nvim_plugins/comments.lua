M = {}

M.install = function(use)
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }
end

M.configure = function()
end

return M
