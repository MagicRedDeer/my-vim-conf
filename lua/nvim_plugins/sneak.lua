return {
    install = function(use)
        vim.g['sneak#label'] = true
        use("justinmk/vim-sneak")
    end,

    configure = function()
        local map = vim.api.nvim_set_keymap
        map ("n", "f", "<Plug>Sneak_f", {})
        map ("n", "F", "<Plug>Sneak_F", {})
        map ("n", "t", "<Plug>Sneak_t", {})
        map ("n", "T", "<Plug>Sneak_T", {})
    end,
}
