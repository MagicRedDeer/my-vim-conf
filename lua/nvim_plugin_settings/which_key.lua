local module = {}

module.install = function(use)
    use {
    "folke/which-key.nvim",
    config = function()
        require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
    end
}
end

module.configure = function ()
    vim.o.timeoutlen = 300
    local mappings = {
        f = {
            name = "file"
        },
        e = {
            name = "edit"
        },
        s = {
            name = "select/other",
            a = { "Select All" }
        }
    }
    local opts = {
        prefix = "<leader>"
    }

    require("which-key").register(mappings, opts)

end

return module
