local module = {}

ascii_art = require('nvim_plugin_settings/startup/ascii_art')

module.install = function(use)
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }
    use {
        'Shatur/neovim-session-manager',
        requires = 'nvim-lua/plenary.nvim'
    }
end

local alpha_configure = function()
    local alpha = require 'alpha'
    local startify = require 'alpha.themes.startify'
    if vim.o.background == 'dark' then
        startify.section.header.val = ascii_art.header_dark_bg
        startify.section.header.opts.position = "center"
        startify.section.footer = {
            { type = "text", val = ascii_art.footer_dark_bg },
        }
    else
        startify.section.header.val = ascii_art.header_light_bg
        startify.section.footer = {
            { type = "text", val = ascii_art.footer_light_bg },
        }
    end
    startify.section.top_buttons.val = {
        startify.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    }
    startify.section.bottom_buttons.val = {
        startify.button( "q", "  Quit NVIM" , ":qa<CR>"),
    }
    alpha.setup(startify.opts)
end

local session_configure = function()
    local Path = require('plenary.path')
    require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
        path_replacer = '__', -- The character to which the path separator will be replaced for session files.
        colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
        autoload_mode = require('session_manager.config').AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
        autosave_last_session = true, -- Automatically save last session on exit.
        autosave_ignore_not_normal = true, -- Plugin will not save a session when no writable and listed buffers are opened.
        autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
    })
    require('telescope').load_extension('sessions')
end

module.configure = function ()
    alpha_configure()
    session_configure()
end

return module
