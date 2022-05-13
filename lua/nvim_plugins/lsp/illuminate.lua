return {
    install = function(use)
        use "RRethy/vim-illuminate"
    end,
    configure = function()
        vim.g.illuminate_delay = 0
    end
}
