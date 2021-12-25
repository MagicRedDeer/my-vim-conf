module = {}

module.install = function(use)
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }
end

module.configure = function()
end

return module
