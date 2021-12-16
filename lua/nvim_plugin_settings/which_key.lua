local module = {}

module.install = function(use)
 use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
end

module.configure = function ()
    vim.o.timeoutlen = 300
end

return module
