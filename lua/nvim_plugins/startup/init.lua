local module = {}

local ascii_art = require("nvim_plugins/startup/ascii_art")

module.install = function(use)
    use {
        "goolord/alpha-nvim",
        requires = {"kyazdani42/nvim-web-devicons"}
    }
    use {
        "xolox/vim-session",
        requires = {"xolox/vim-misc"}
    }
end

local function centrify(opts)
    if opts.type == "text" or opts.type == "button" then
        -- centrify text and position
        _opts = opts.opts
        if _opts == nil then
            opts.opts = {}
            _opts = opts.opts
        end
        -- button settings
        _opts.position = "center"
        _opts.width = 80
    elseif opts.type == "group" then
        -- groups val could be functions
        if type(opts.val) == "function" then
            local value = opts.val
            opts.val = function()
                return centrify(value())
            end
        end
    end
    -- do the table values again
    for key, value in pairs(opts) do
        if type(value) == "table" then
            opts[key] = centrify(value)
        end
    end
    return opts
end

local alpha_configure = function()
    local alpha = require "alpha"
    package.loaded["alpha.themes.startify"] = nil
    local startify = require "alpha.themes.startify"
    startify.section.header.opts.hl = "DevIconImportConfiguration"
    if vim.o.background == "dark" then
        startify.section.header.val = ascii_art.header_dark_bg
    else
        startify.section.header.val = ascii_art.header_light_bg
    end
    startify.section.top_buttons.val = {
        startify.button("e", "  New file", ":ene <BAR> startinsert <CR>")
    }
    startify.section.bottom_buttons.val = {
        startify.button("q", "  Quit NVIM", ":qa<CR>")
    }
    centrify(startify.opts)
    alpha.setup(startify.opts)
end

local session_configure = function()
    vim.g.session_directory = vim.fn.stdpath("data") .. "/sessions"
    vim.g.session_lock_enabled = 0
    vim.g.session_autosave = "no"
    vim.g.session_autoload = "no"
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,localoptions,tabpages,terminal,winsize"
    -- TODO integrate with alpha and telescope
end

module.configure = function()
    alpha_configure()
    session_configure()
end

return module
