local servers = {
    'html', 'cssls', 'tsserver', 'pylsp'
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities())

print ('configuring language servers...', vim.inspect(servers))
require'lspconfig'.html.setup { capabilities = capabilities }
require'lspconfig'.cssls.setup { capabilities = capabilities }
require'lspconfig'.tsserver.setup { capabilities = capabilities }
require'lspconfig'.pylsp.setup { capabilities = capabilities }
