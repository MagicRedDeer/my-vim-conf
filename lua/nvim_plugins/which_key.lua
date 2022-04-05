local M = {}

M.install = function(use)
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                window = {
                    border = "single",
                },
                layout = {
                    align = "center",
                },
            }
        end
    }
end

M.configure = function()
    vim.o.timeoutlen = 1000

    local mappings = {
        f = {
            name = "file"
        },
        e = {
            name = "edit"
        },
        s = {
            name = "select/search"
        },
        b = {
            name = "buffers"
        }
    }

    local utils = require("nvim_utils")
    utils.update_which_key_maps(mappings)

    require("which-key").register(
        utils.get_which_key_maps(), {prefix = "<leader>"})
    require("which-key").register(
        utils.get_which_key_maps("x"), {mode = "x", prefix = "<leader>"})
end

return M
