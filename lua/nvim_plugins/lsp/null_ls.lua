local M = {}

M.install = function(use)
    use("jose-elias-alvarez/null-ls.nvim")
end

M.configure = function()
    local null_ls = require("null-ls")

    null_ls.setup({
        debug = false,
        sources = {
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.yapf,
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
        },
    })

    require("nvim_utils").keymap(
        "n",
        "<leader>lf",
        "<cmd>lua vim.lsp.buf.formatting()<cr>",
        { noremap = true, silent = true, desc = "Format" }
    )

    require("nvim_utils")
end

return M
