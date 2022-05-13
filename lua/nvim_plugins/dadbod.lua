local utils = require('nvim_utils')

return {
    install = function(use)
        use { 'tpope/vim-dadbod' }
        use { 'kristijanhusak/vim-dadbod-ui' }
    end,

    configure = function (use)
        utils.keymap("n", "<leader>uu", "<cmd>DBUIToggle<CR>", {
            silent = true, noremap = True, desc="Dadbod / UI / Toggle"
        })
        utils.keymap("n", "<leader>uf", "<cmd>DBUIFindBuffer<CR>", {
            silent = true, noremap = True, desc="Dadbod / UI / Find Buffer"
        })
        utils.keymap("n", "<leader>ur", "<cmd>DBUIRenameBuffer<CR>", {
            silent = true, noremap = True, desc="Dadbod / UI / Rename Buffer"
        })
        utils.keymap("n", "<leader>ul", "<cmd>DBUILastQueryInfo<CR>", {
            silent = true, noremap = True, desc="Dadbod / UI / Last Query Info"
        })

        utils.update_which_key_maps {
            u = {
                name = "Dadbod"
            }
        }
    end
}
