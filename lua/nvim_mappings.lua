vim.g.mapleader = ' '

-- moving from terminal
vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>', {noremap=true})
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', {noremap=true})
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', {noremap=true})
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', {noremap=true})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', {noremap=true})
vim.api.nvim_set_keymap('t', '<C-w>', '<C-\\><C-n><C-w>', {noremap=true})

--moving in windows
vim.api.nvim_set_keymap('', '<c-j>', '<c-w>j', {noremap=true})
vim.api.nvim_set_keymap('', '<c-h>', '<c-w>h', {noremap=true})
vim.api.nvim_set_keymap('', '<c-k>', '<c-w>k', {noremap=true})
vim.api.nvim_set_keymap('', '<c-l>', '<c-w>l', {noremap=true})

-- when wrapping is enabled do wrap friendly scrolling
vim.api.nvim_set_keymap('n', 'j', 'gj', {noremap=true})
vim.api.nvim_set_keymap('n', 'k', 'gk', {noremap=true})

-- move visual block up/down one
vim.api.nvim_set_keymap('v', '<c-j>', '"td"tp\'[V\']', {})
vim.api.nvim_set_keymap('v', '<c-k>', '"tdk"tP\'[V\']', {})

-- move a line up or down
vim.api.nvim_set_keymap('n', '-', '"tdd"tp', {noremap=true})
vim.api.nvim_set_keymap('n', '_', '"tddk"tP', {noremap=true})

vim.api.nvim_set_keymap('i', '<C-U>', '<C-G>u<C-U>', {noremap=true})
-- vim.api.nvim_set_keymap('n', '<localleader><CR>', 'i<CR><ESC>k$', {silent=true})

-- Meta-A is Select all
vim.api.nvim_set_keymap('', '<M-a>', 'gggH<C-O>G', {noremap=true})
vim.api.nvim_set_keymap('i', '<M-a>', '<C-O>gg<C-O>gH<C-O>G', {noremap=true})
vim.api.nvim_set_keymap('c', '<M-a>', '<C-C>gggH<C-O>G', {noremap=true})
vim.api.nvim_set_keymap('o', '<M-a>', '<C-C>gggH<C-O>G', {noremap=true})
vim.api.nvim_set_keymap('s', '<M-a>', '<C-C>gggH<C-O>G', {noremap=true})
vim.api.nvim_set_keymap('x', '<M-a>', '<C-C>ggVG', {noremap=true})

-- Indentation changes, but visual stays
vim.api.nvim_set_keymap('v', '>', '><CR>gv', {noremap=true})
vim.api.nvim_set_keymap('v', '<', '<<CR>gv', {noremap=true})

-- sourcing vimrc
vim.api.nvim_set_keymap('n', '<leader>fv', ':source $MYVIMRC<cr>', {noremap=true})
