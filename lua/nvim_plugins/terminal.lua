M = {}

M.install = function(use)
    use {"akinsho/toggleterm.nvim"}
end

M.configure = function()
    require("toggleterm").setup {
        -- size can be a number or function which is passed the current terminal
        size = function(term)
            if term.direction == "horizontal" then
                return vim.o.lines * 0.25
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
            end
        end,
        hide_numbers = true, -- hide the number column in toggleterm buffers
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        start_in_insert = false,
        insert_mappings = false, -- whether or not the open mapping applies in insert mode
        persist_size = false,
        direction = "horizontal", -- "vertical" | "horizontal" | "window" | "float",
        close_on_exit = true, -- close the terminal window when the process exits
        shell = vim.o.shell, -- change the default shell
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
            border = "curved",
            width = math.floor(vim.o.columns * 0.8),
            height = math.floor(vim.o.lines * 0.8),
            winblend = 3,
            highlights = {
                border = "Normal",
                background = "Normal"
            }
        }
    }

    vim.g.toggleterm_terminal_mapping = "<leader>tt"
    vim.cmd [[
        nnoremap <silent><leader>tt <Cmd>exe v:count1 . "ToggleTerm"<CR>
        nnoremap <silent><leader>ts <Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>
        nnoremap <silent><leader>tv <Cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>
        nnoremap <silent><leader>tb <Cmd>exe v:count1 . "ToggleTerm direction=tab"<CR>
        nnoremap <silent><leader>tf <Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>
    ]]

    require("nvim_utils").update_which_key_maps {
        t = {
            name = "terminals",
            t = {"Toggle Terminal"},
            s = {"Split Terminal"},
            v = {"Vertical Terminal"},
            b = {"Tabbed Terminal"},
            f = {"Floating Terminal"}
        }
    }
end

return M
