return function ()
    require "nvim_utils".update_which_key_maps {
        l = {
            name = "language / LSP",
        }
    }
    local map = require('nvim_utils').keymap

    map("n", "<leader>li", ":LspInfo<cr>", {noremap=true, silent=true, desc="Connected Language Servers"})
    map("n", "<leader>lk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {noremap=true, silent=true, desc="Signature Help"})
    map("n", "<leader>lw", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", {noremap=true, silent=true, desc="Add Workspace Folder"})
    map("n", "<leader>lW", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", {noremap=true, silent=true, desc="Remove Workspace Folder"})
    map("n", "<leader>ll", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", {noremap=true, silent=true, desc="List Workspace Folders"})
    map("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {noremap=true, silent=true, desc="Type Definition"})
    map("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", {noremap=true, silent=true, desc="Go To Definition"})
    map("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", {noremap=true, silent=true, desc="Go To Declaration"})
    map("n", "<leader>ls", "<cmd>lua vim.cmd('rightbelow vsplit'); vim.lsp.buf.definition()<cr>", {noremap=true, silent=true, desc="Split and Go To Definition"})
    map("n", "<leader>lS", "<cmd>lua vim.cmd('rightbelow vsplit'); vim.lsp.buf.declaration()<cr>", {noremap=true, silent=true, desc="Split and Go To Declaration"})
    map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", {noremap=true, silent=true, desc="References"})
    map("n", "<leader>lh", "<cmd>lua vim.lsp.buf.document_highlight()<cr>", {noremap=true, silent=true, desc="Doc Highlight"})
    map("n", "<leader>lH", "<cmd>lua vim.lsp.buf.document_highlight_kind()<cr>", {noremap=true, silent=true, desc="Doc Highlight Kind"})
    map("n", "<leader>lc", "<cmd>lua vim.lsp.buf.clear_references()<cr>", {noremap=true, silent=true, desc="Highlight kind"})
end
