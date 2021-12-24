local module = {}

module.install = function(use)
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
end

module.configure = function ()
    require('telescope').setup{
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key"
                }
            }
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
        }
    }

    local map = require('nvim_utils').keymap

    -- b maps
    map ('n', '<leader>bf', ":Telescope buffers<CR>",
    {noremap=true, silent=true, desc='Find Buffers (Telescope)'})

    -- f maps
    map ('n', '<leader>ff', ":Telescope find_files<CR>",
    {noremap=true, silent=true, desc='File Finder (Telescope)'})
    map ('n', '<leader>fg', ":Telescope live_grep<CR>",
    {noremap=true, silent=true, desc='File grep (Telescope)'})
    map ('n', '<leader>fo', ":Telescope oldfiles<CR>",
    {noremap=true, silent=true, desc='Files: Old (Telescope)'})

    -- s maps
    map ('n', '<leader>sg', ":live_grep<CR>",
    {noremap=true, silent=true, desc='Search by Grep'})
    map ('n', '<leader>ss', ":Telescope<CR>",
    {noremap=true, silent=true, desc='Search by Telescope'})
    map ('n', '<leader>sb', ":Telescope marks<CR>",
    {noremap=true, silent=true, desc='Search bookmarks'})
    map ('n', '<leader>sc', ":Telescope colorscheme<CR>",
    {noremap=true, silent=true, desc='Search ColorSchemes'})
end


return module
