local module = {}

module.install = function(use)
   use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'} 
end

module.configure = function ()
    require'nvim-treesitter.configs'.setup {
        ensure_installed = {
            "c", "c_sharp", "cpp", "css", "glsl", "html", "javascript",
            'json', "latex", "make", "markdown", "lua", "php", "python","r",
            "typescript", "vim", "yaml"},
        -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

        -- set highlighting to true
        highlight = {
            enable = true,              -- false will disable the whole extension
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    }
end

return module
