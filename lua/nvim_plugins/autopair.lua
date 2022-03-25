local M = {}

M.install = function(use)
    use "windwp/nvim-autopairs"
end

M.configure = function()
    require("nvim-autopairs").setup {
        check_ts = true
    }
end

return M
