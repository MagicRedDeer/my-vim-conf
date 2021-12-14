
-- some display and window settings
vim.o.ruler = true               -- show the cursor position all the time
vim.o.wrap = false              -- Dont wrap from screen end
vim.o.number = false             -- show display settings
vim.o.showcmd = true             -- display incomplete commands
vim.o.list = true                -- visualizing tabs, spaces, trails etc.
vim.o.listchars='tab:>.,trail:.,extends:#,nbsp:.,precedes:%,eol:~'
vim.o.fixendofline=false
vim.o.laststatus=2
vim.o.showmode=false
-- vim.o.formatoptions:remove({'t'])  -- Don't wrap while typing
vim.o.viewoptions='cursor,options,folds,slash,unix'
vim.o.shortmess = vim.o.shortmess .. 'c'

-- windows 
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.equalalways = true

-- behaviour
vim.o.visualbell = true
vim.o.hidden = true
