local M = {}

M.install = function(use)
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "windwp/nvim-ts-autotag"
    use "p00f/nvim-ts-rainbow"
end

M.configure = function()
    -- for some bugfix with lsp
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics,
        {
            underline = true,
            virtual_text = {
                spacing = 5,
                severity_limit = "Warning"
            },
            update_in_insert = true
        }
    )

    require "nvim-treesitter.configs".setup {
        ensure_installed = {
            "c",
            "c_sharp",
            "cpp",
            "css",
            "glsl",
            "html",
            "javascript",
            "json",
            "latex",
            "make",
            "markdown",
            "lua",
            "php",
            "python",
            "r",
            "typescript",
            "vim",
            "yaml"
        },
        -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        -- set highlighting to true
        highlight = {
            enable = true, -- false will disable the whole extension
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false
        },
        autotag = {
            enable = true
        },
        rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        }
    }

    vim.cmd [[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
    ]]
end

return M
