local servers = {
    'html', 'cssls', 'tsserver', 'pylsp'
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.html.setup { capabilities = capabilities }
require'lspconfig'.cssls.setup { capabilities = capabilities }
require'lspconfig'.tsserver.setup { capabilities = capabilities }
require'lspconfig'.pylsp.setup { capabilities = capabilities }

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = capabilities
}

local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'

if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact',
        'typescript', 'typescriptreact', 'haml', 'xml', 'xsl', 'pug', 'slim',
        'sass', 'stylus', 'less', 'sss'};
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end

capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.ls_emmet.setup{ capabilities = capabilities }
