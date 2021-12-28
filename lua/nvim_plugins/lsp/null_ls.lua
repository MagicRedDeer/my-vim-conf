local M = {}

M.install = function(use)
    use("jose-elias-alvarez/null-ls.nvim")
end

M.configure = function()
    local null_ls = require("null-ls")

    null_ls.setup({
        debug = false,
        sources = {
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.yapf,
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.stylua,
        },
    })

    require("nvim_utils").update_which_key_maps({
        l = {
            f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
        },
    })

    require("nvim_utils")
end

return M
