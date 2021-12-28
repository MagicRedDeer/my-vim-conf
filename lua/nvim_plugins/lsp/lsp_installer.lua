local M = {}

M.install = function(use)
    use {
        "williamboman/nvim-lsp-installer",
        requires = { "neovim/nvim-lspconfig" } -- enable LSP
    }
    use "tamago324/nlsp-settings.nvim"
end

M.configure = function()
    local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
    if not status_ok then
        vim.fn.error("cannot require nvim-lsp-installer")
        return
    end


    -- settings icons for lsp installer
    lsp_installer.settings({
        ui = {
            icons = {
                server_installed = "✓",
                server_pending = "➜",
                server_uninstalled = "✗",
            }
        }
    })

    -- Register a handler that will be called for all installed servers.
    -- Alternatively, you may also register handlers on specific server instances instead (see example below).
    lsp_installer.on_server_ready(function(server)
        local opts = {
            capabilities = require('nvim_plugins.lsp.cmp').capabilities
        }

        if server.name == 'sumneko_lua' then
            local sumneko_lua_opts = require('nvim_plugins.lsp.settings.sumneko_lua')
            opts = vim.tbl_deep_extend("force", opts, sumneko_lua_opts)
        end

        server:setup(opts)
    end)

    require ('nvim_utils').keymap('n', '<leader>lI', ':LspInstallInfo<CR>', {
        noremap=true, silent=true, desc="Lsp Install Info"})
end

return M
