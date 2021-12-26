M = {}

M.install = function(use)
    use {"mhartington/formatter.nvim"}
end

M.configure = function()
    require("formatter").setup {
        filetype = {
            javascript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
                        stdin = true
                    }
                end
            },
            python = {
                function()
                    return {
                        exe = "python3 -m yapf",
                        args = {
                            "--in-place --style pep8",
                            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
                        },
                        stdin = false
                    }
                end
            },
            lua = {
                function()
                    return {
                        exe = "luafmt",
                        args = {"--indent-count", 4, "--stdin"},
                        stdin = true
                    }
                end
            }
        }
    }
    vim.api.nvim_exec(
        [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua,*.js,*.py FormatWrite
    augroup END
    ]],
        true
    )
end

return M
