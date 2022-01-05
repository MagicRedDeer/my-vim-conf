local ascii_art = require("nvim_plugins/startup/ascii_art")

local function sessions_buttons(theme, start, num)
    local sessions = vim.fn["xolox#session#get_names"](0)
    local buttons = {}
    num = vim.F.if_nil(num, 10)
    for n, session in ipairs(sessions) do
        if #buttons == num then
            break
        end
        local button = theme.button(tostring(n + start - 1), session, ":OpenSession! " .. session .. "<CR>")
        buttons[n] = button
    end
    return {
        type = "group",
        val = buttons,
        opts = {},
    }
end

local function patch_theme(theme, layout_index, button_start)
    layout_index = vim.F.if_nil(layout_index, 7)
    button_start = vim.F.if_nil(button_start, 20)
    theme.section.sessions = {
        type = "group",
        val = {
            { type = "padding", val = 1 },
            { type = "text", val = "Sessions", opts = { hl = "SpecialComment" } },
            { type = "padding", val = 1 },
            {
                type = "group",
                val = function()
                    return { sessions_buttons(theme, button_start) }
                end,
            },
        },
    }
    table.insert(theme.opts.layout, layout_index, theme.section.sessions)
    table.insert(theme.opts.layout, layout_index, { type = "padding", val = 1 })
end

local function centrify(opts)
    if opts.type == "text" or opts.type == "button" then
        -- centrify text and position
        local _opts = opts.opts
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

return {

    install = function(use)
        use({
            "goolord/alpha-nvim",
            requires = { "kyazdani42/nvim-web-devicons" },
        })
    end,

    configure = function()
        local alpha = require("alpha")
        package.loaded["alpha.themes.startify"] = nil
        local startify = require("alpha.themes.startify")
        startify.section.header.opts.hl = "DevIconImportConfiguration"
        if vim.o.background == "dark" then
            startify.section.header.val = ascii_art.header_dark_bg
        else
            startify.section.header.val = ascii_art.header_light_bg
        end
        startify.section.top_buttons.val = {
            startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        }
        startify.section.bottom_buttons.val = {
            startify.button("q", "  Quit NVIM", ":qa<CR>"),
        }
        patch_theme(startify, 7, 20)
        centrify(startify.opts)
        alpha.setup(startify.opts)
    end,
}
