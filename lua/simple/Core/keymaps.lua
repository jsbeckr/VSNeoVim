local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", options)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v'
--   visual_bloCk_mode = 'x',
--   term_mode = 't',
--   Command_mode = 'c',
--   all_mode = ' ',
-- Better window navigations
keymap('n', '<C-h>', '<C-w>h', options)
keymap('n', '<C-j>', '<C-w>j', options)
keymap('n', '<C-k>', '<C-w>k', options)
keymap('n', '<C-l>', '<C-w>l', options)
-- Lexplore
keymap('n', '<leader>e', ':Lex 36<CR>', options)
-- Resize with arrows
keymap('n', '<C-S-Up>', ':resize -2<CR>', options)
keymap('n', '<C-S-Down>', ':resize +2<CR>', options)
keymap('n', '<C-S-Left>', ':vertical resize +2<CR>', options)
keymap('n', '<C-S-Right>', ':vertical resize -2<CR>', options)
-- Navigate Buffers
keymap('n', '<C-Tab>', ':bp!<CR>', options)
keymap('n', '<C-S-Tab>', ':bn!<CR>', options)
-- Indentline texts
keymap('n', '<S-Tab>', '<gv', options)
keymap('n', '<Tab>', '>gv', options)
keymap('v', '<S-Tab>', '<gv', options)
keymap('v', '<Tab>', '>gv', options)
-- Move text up and down
keymap("n", "J", ":m .+1<CR>==", options)
keymap("n", "K", ":m .-2<CR>==", options)
keymap("v", "<A-j>", ":m .+1<CR>==", options)
keymap("v", "<A-k>", ":m .-2<CR>==", options)
keymap("x", "J", ":move '>+1<CR>gv-gv", options)
keymap("x", "K", ":move '<-2<CR>gv-gv", options)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", options)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", options)
-- Home and End
keymap('n', 'L', '<end>', options)
keymap('n', 'H', '<home>', options)
keymap('v', 'L', '<end>', options)
keymap('v', 'H', '<home>', options)
-- Undo and Redo
keymap('n', '<C-z>', ':undo<CR>', options)
keymap('n', '<C-y>', ':redo<CR>', options)
-- Tabs
keymap('n', '<C-w>', ':BufDel<CR>', options)
-- Nvim Tree
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', options)
-- Tagbar
keymap('n', '<C-t>', ':SymbolsOutline<CR>', options)
-- Maximizer
keymap('n', 'z', ':MaximizerToggle<CR>', options)
