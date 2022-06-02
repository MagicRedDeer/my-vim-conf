return {
    install = function(use)
        use 'heavyimage/nuke.vim'
    end,

    configure = function()
        vim.g.nukevimHost = '127.0.0.1'
        vim.g.nukevimPort = '10191'

        require("nvim_utils").keymap("n", "<leader>ns", "<cmd>py nukevimRun()<cr>",
            { noremap = true, silent = true, desc = "Nuke / Send" })
        require("nvim_utils").keymap("v", "<leader>ns", "<cmd>py nukevimRun()<cr>",
            { noremap = true, silent = true, desc = "Nuke / Send" })
        require("nvim_utils").keymap(
            "n", "<leader>nb", "<cmd>py nukevimRun(forceBuffer = True)<cr>",
            { noremap = true, silent = true, desc = "Nuke / Buffer" })
        require("nvim_utils").keymap(
            "v", "<leader>nb", "<cmd>py nukevimRun(forceBuffer = True)<cr>",
            { noremap = true, silent = true, desc = "Nuke /  Buffer" })
        require("nvim_utils").keymap("n", "<leader>nr", "<cmd>py nukevimResetScratchWindow()<cr>",
            { noremap = true, silent = true, desc = "Nuke / Send" })

        require("nvim_utils").update_which_key_maps({
            n = { name = "Nuke" },
        })
    end
}
