module = {}

local signs_configure = require "nvim_plugins.lsp.signs"
local servers_configure = require "nvim_plugins.lsp.servers"

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

module.install = function(use)
    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"
    use "onsails/lspkind-nvim"
end

module.configure = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup(
        ---@diagnostic disable-next-line: redundant-parameter
        {
            -- REQUIRED - you must specify a snippet engine
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end
            },
            mapping = {
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
                ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                ["<C-e>"] = cmp.mapping(
                    {
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close()
                    }
                ),
                -- Accept currently selected item. If none selected, `select` first item.
                -- Set `select` to `false` to only confirm explicitly selected items.
                ["<CR>"] = cmp.mapping.confirm({select = true}),
                ["<Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                        end
                    end,
                    {"i", "s"}
                ),
                ["<S-Tab>"] = cmp.mapping(
                    function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        end
                    end,
                    {"i", "s"}
                )
            },
            sources = cmp.config.sources(
                {
                    {name = "nvim_lsp"},
                    {name = "vsnip"} -- For vsnip users.
                    -- { name = 'luasnip' }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                },
                {
                    {name = "buffer"}
                }
            ),
            formatting = {
                format = lspkind.cmp_format(
                    {
                        with_text = true, -- do not show text alongside icons
                        maxwidth = 50 -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    }
                )
            }
        }
    ) -- end setup

    -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(
        "/",
        {
            sources = {
                {name = "buffer"}
            }
        }
    )

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(
        ":",
        {
            sources = cmp.config.sources(
                {
                    {name = "path"}
                },
                {
                    {name = "cmdline"}
                }
            )
        }
    )

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done(
            {
                map_char = {tex = ""}
            }
        )
    )

    require "nvim_utils".update_which_key_maps {
        l = {
            name = "LSP",
            i = {":LspInfo<cr>", "Connected Language Servers"},
            k = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help"},
            w = {"<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "Add Workspace Folder"},
            W = {"<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "Remove Workspace Folder"},
            l = {"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folders"},
            t = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition"},
            d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition"},
            D = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration"},
            r = {"<cmd>lua vim.lsp.buf.references()<cr>", "References"}
        }
    }

    signs_configure()
    servers_configure()
end

return module
