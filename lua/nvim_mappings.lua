vim.g.mapleader = ' '

map = vim.api.nvim_set_keymap

-- moving from terminal
map ('t', '<Esc><Esc>', '<C-\\><C-n>', {noremap=true})
map ('t', '<C-k>', '<C-\\><C-n><C-w>k', {noremap=true})
map ('t', '<C-l>', '<C-\\><C-n><C-w>l', {noremap=true})
map ('t', '<C-h>', '<C-\\><C-n><C-w>h', {noremap=true})
map ('t', '<C-j>', '<C-\\><C-n><C-w>j', {noremap=true})
map ('t', '<C-w>', '<C-\\><C-n><C-w>', {noremap=true})

--moving in windows
map ('', '<c-j>', '<c-w>j', {noremap=true})
map ('', '<c-h>', '<c-w>h', {noremap=true})
map ('', '<c-k>', '<c-w>k', {noremap=true})
map ('', '<c-l>', '<c-w>l', {noremap=true})

-- when wrapping is enabled do wrap friendly scrolling
map ('n', 'j', 'gj', {noremap=true})
map ('n', 'k', 'gk', {noremap=true})

-- move visual block up/down one
map ('v', '<c-j>', '"td"tp\'[V\']', {})
map ('v', '<c-k>', '"tdk"tP\'[V\']', {})

-- move a line up or down
map ('n', '-', '"tdd"tp', {noremap=true})
map ('n', '_', '"tddk"tP', {noremap=true})

map ('i', '<C-U>', '<C-G>u<C-U>', {noremap=true})
-- map ('n', '<localleader><CR>', 'i<CR><ESC>k$', {silent=true})

-- Meta-A is Select all
map ('', '<M-a>', 'gggH<C-O>G', {noremap=true})
map ('i', '<M-a>', '<C-O>gg<C-O>gH<C-O>G', {noremap=true})
map ('c', '<M-a>', '<C-C>gggH<C-O>G', {noremap=true})
map ('o', '<M-a>', '<C-C>gggH<C-O>G', {noremap=true})
map ('s', '<M-a>', '<C-C>gggH<C-O>G', {noremap=true})
map ('x', '<M-a>', '<C-C>ggVG', {noremap=true})

-- Indentation changes, but visual stays
map ('v', '>', '><CR>gv', {noremap=true})
map ('v', '<', '<<CR>gv', {noremap=true})

-- sourcing vimrc
map ('n', '<leader>fv', ':source $MYVIMRC<cr>', {noremap=true})
