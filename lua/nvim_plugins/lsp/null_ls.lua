local M = {}

M.install = function(use)
    use "jose-elias-alvarez/null-ls.nvim"
end

M.configure = function()
    null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup(
        {
            debug = false,
            sources = {
                formatting.prettier,
                formatting.yapf,
                formatting.isort,
                formatting.stylua.with({extra_args = {"--indent-type Spaces"}})
            }
        }
    )

    require("nvim_utils").update_which_key_maps(
        {
            l = {
                f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"}
            }
        }
    )

    require("nvim_utils")

end

return M
