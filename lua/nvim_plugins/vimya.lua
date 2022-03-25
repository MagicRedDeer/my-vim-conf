return {

    install = function(use)
        use({
            "MagicRedDeer/vimya.vim",
            requires = "vim-scripts/Tail-Bundle",
        })
    end,

    configure = function()
        vim.g.Tail_Height = 15
        vim.g.vimyaPort = 7720
        vim.g.vimyaTailCommand = "STail"
        vim.g.vimyaSplitBelow = 1
        vim.g.vimyaForceRefresh = 1
        vim.g.vimyaRefreshWait = 2.0

        require("nvim_utils").keymap(
            "n",
            "<leader>mr",
            ":py vimyaRefreshLog ()<cr>",
            { noremap = true, silent = true, desc = "Maya / Refresh" }
        )
        require("nvim_utils").keymap(
            "n",
            "<leader>mt",
            ":py vimyaOpenLog ()<cr>",
            { noremap = true, silent = true, desc = "Maya / Open Log" }
        )
        require("nvim_utils").keymap(
            "n",
            "<leader>ml",
            ":py vimyaResetLog ()<cr>",
            { noremap = true, silent = true, desc = "Maya / Reset Log" }
        )
        require("nvim_utils").keymap(
            "n",
            "<leader>mw",
            ":VimyaWhatIs <cr>",
            { noremap = true, silent = true, desc = "Maya / What Is" }
        )
        require("nvim_utils").keymap(
            "n",
            "<leader>mu",
            ":VimyaSend undo()<cr>",
            { noremap = true, silent = true, desc = "Maya / Send Undo" }
        )
        require("nvim_utils").keymap(
            "n",
            "<leader>mU",
            ":VimyaSend redo()<cr>",
            { noremap = true, silent = true, desc = "Maya / Send Redo" }
        )

        require("nvim_utils").update_which_key_maps({
            m = { name = "Maya" },
        })
    end,
}
