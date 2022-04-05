local nvim_utils = require "nvim_utils"
local configure_signs = function ()
    vim.fn.sign_define('DapBreakpoint', {text='↘', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapLogPoint', {text='↗', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapBreakpointCondition', {text='↙', texthl='', linehl='', numhl=''})
end

local configure_maps = function ()
    map = nvim_utils.keymap

    map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", {silent=true, noremap=true, desc="continue/start"})
    map("n", "<F6>", "<cmd>lua require'dap'.run_to_cursor()<CR>", {silent=true, noremap=true, desc="run_to_cursor"})
    map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", {silent=true, noremap=true, desc="next/step_over"})
    map("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", {silent=true, noremap=true, desc="step_into"})
    map("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", {silent=true, noremap=true, desc="step_out"})

    map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", {silent=true, noremap=true, desc="continue/start"})
    map("n", "<leader>dn", "<cmd>lua require'dap'.step_over()<CR>", {silent=true, noremap=true, desc="next/step_over"})
    map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", {silent=true, noremap=true, desc="step_into"})
    map("n", "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", {silent=true, noremap=true, desc="step_out"})

    map("n", "<leader>du", "<cmd>lua require'dap'.up()<CR>", {silent=true, noremap=true, desc="up"})
    map("n", "<leader>dd", "<cmd>lua require'dap'.down()<CR>", {silent=true, noremap=true, desc="down"})

    map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {silent=true, noremap=true, desc="toggle_breakpoint"})
    map("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {silent=true, noremap=true, desc="breakpoint condition"})
    map("n", "<leader>dp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {silent=true, noremap=true, desc="log point"})

    map("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", {silent=true, noremap=true, desc="repl_toggle"})
    map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", {silent=true, noremap=true, desc="run_last"})
    map("n", "<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<CR>", {silent=true, noremap=true, desc="hover"})
    map("n", "<leader>dv", "<cmd>lua require'dap.ui.widgets'.visual_hover()<CR>", {silent=true, noremap=true, desc="visual_hover"})
    map("n", "<leader>ds", "<cmd>lua local widgets=require'dap.ui.widgets'; widgets.centered_float(widgets.scopes)<CR>", {silent=true, noremap=true, desc="scopes"})

    map("n", "<leader>da", "<cmd>lua require'dap'.attach()<CR>", {silent=true, noremap=true, desc="attach"})
    map("n", "<leader>df", "<cmd>Telescope dap frames<CR>", {silent=true, noremap=true, desc="Telescope frames"} )
    map("n", "<leader>dt", "<cmd>Telescope dap list_breakpoints<CR>", {silent=true, noremap=true, desc="Telescope breakpoints"} )

    map("n", "<leader>dq", "<cmd>lua require('dapui').toggle()<CR>", {silent=true, noremap=true, desc="Telescope breakpoints"} )

    map("n", "<leader>de", "<cmd>lua require('dap').terminate(); require'dap'.close()<CR>", {silent=true, noremap=true, desc="terminate and close"} )
end

return {
    install = function (use)
        use "mfussenegger/nvim-dap"
        use {
            "mfussenegger/nvim-dap-python",
            requires = {{"mfussenegger/nvim-dap"}}
        }
        use {
            "nvim-telescope/telescope-dap.nvim",
            requires = {{"nvim_telescope/telescope.nvim"}}
        }
        use {
            "theHamsta/nvim-dap-virtual-text",
            requires = {{"mfussenegger/nvim-dap"}}
        }
        use {
            "rcarriga/nvim-dap-ui",
            requires = {{"mfussenegger/nvim-dap"}}
        }
    end,

    configure = function ()
        local dap = require('dap')
        dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

        require('dap-python').setup('python')
        require('telescope').load_extension('dap')
        require('dapui').setup()
        configure_signs()
        configure_maps()
        vim.g.dap_virtual_text = true
    end
}
