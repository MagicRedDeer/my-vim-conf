return {
    install = function (use)
        use "qpkorr/vim-bufkill"
    end,

    configure = function ()
        local map = require('nvim_utils').keymap
        map("n", "<leader>bw", ":BW<cr>", {noremap = true, desc = "Buffer / Wipe"})
        map("n", "<leader>bd", ":BD<cr>", {noremap = true, desc = "Buffer / Delete"})
        map("n", "<leader>bu", ":BUN<cr>", {noremap = true, desc = "Buffer / Unload"})
        map("n", "<leader>bn", ":BF<cr>", {noremap = true, desc = "Buffer / Next"})
        map("n", "<leader>bp", ":BB<cr>", {noremap = true, desc = "Buffer / Previous"})
        map("n", "<leader>ba", ":BA<cr>", {noremap = true, desc = "Buffer / Alternate"})
    end
}
