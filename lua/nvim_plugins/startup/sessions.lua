return {
    install = function(use)
        use({
            "xolox/vim-session",
            requires = { "xolox/vim-misc" },
        })
    end,

    configure = function()
        vim.g.session_directory = vim.fn.stdpath("data") .. "/sessions"
        vim.g.session_lock_enabled = 0
        vim.g.session_autosave = "yes"
        vim.g.session_autoload = "yes"
        vim.g.session_default_overwrite = true
        vim.g.session_default_to_last = true
        vim.o.sessionoptions = "blank,buffers,curdir,folds,help,localoptions,tabpages,terminal,winsize"
        -- TODO integrate with alpha and telescope
    end,
}
