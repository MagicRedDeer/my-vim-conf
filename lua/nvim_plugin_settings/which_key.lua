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
        q = {
            name = "quit"
        },
        wq = {
            name = "write and quit"
        },
        f = {
            name = "file",
            s = {name="file save"},
        },
        e = {
            name = "edit"
        },
        s = {
            name = "select/search",
            a = { "Select All" }
        },
        b = {
            name = "buffers",
            w = {name = "buffer wipeout"},
            d = {name = "buffer delete"},
        },
        l = require'nvim_plugin_settings/lsp'.maps.l
    }
    local opts = {
        prefix = "<leader>"
    }

    require("which-key").register(mappings, opts)

end

return module
