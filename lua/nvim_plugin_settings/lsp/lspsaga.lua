module = {}

module.install = function(use)
    use "tami5/lspsaga.nvim"
end

module.configure = function()
    local lspsaga = require("lspsaga")
    lspsaga.setup(
        {
            -- defaults ...
            debug = false,
            use_saga_diagnostic_sign = true,
            -- diagnostic sign
            error_sign = "",
            warn_sign = "",
            hint_sign = "",
            infor_sign = "",
            diagnostic_header_icon = "   ",
            -- code action title icon
            code_action_icon = " ",
            code_action_prompt = {
                enable = true,
                sign = true,
                sign_priority = 40,
                virtual_text = true
            },
            finder_definition_icon = "  ",
            finder_reference_icon = "  ",
            max_preview_lines = 10,
            finder_action_keys = {
                open = "o",
                vsplit = "s",
                split = "i",
                quit = "q",
                scroll_down = "<C-f>",
                scroll_up = "<C-b>"
            },
            code_action_keys = {
                quit = "q",
                exec = "<CR>"
            },
            rename_action_keys = {
                quit = "<C-c>",
                exec = "<CR>"
            },
            definition_preview_icon = "  ",
            border_style = "single",
            rename_prompt_prefix = "➤",
            server_filetype_map = {},
            diagnostic_prefix_format = "%d. "
        }
    )
    require "nvim_utils".update_which_key_maps {
        l = {
            name = "LSP",
            K = {"<cmd>Lspsaga hover_doc<cr>", "Hover Commands"},
            R = {"<cmd>Lspsaga rename<cr>", "Rename"},
            a = {"<cmd>Lspsaga code_action<cr>", "Code Action"},
            e = {"<cmd>Lspsaga show_line_diagnostics<cr>", "Show Line Diagnostics"},
            n = {"<cmd>Lspsaga diagnostic_jump_next<cr>", "Go To Next Diagnostic"},
            N = {"<cmd>Lspsaga diagnostic_jump_prev<cr>", "Go To Previous Diagnostic"}
        }
    }
end

return module
