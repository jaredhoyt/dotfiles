-- Set leader to Space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--  normal_mode = 'n'
--  insert_mode = 'i'
--  visual_mode = 'v'
--  visual_block_mode =  'x'
--  term_mode = 't'
--  command_mode = 'c'

-- Shorten function name
local keymap = vim.keymap.set


-- [[ Normal mode ]] --

-- Clear highlights
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Buffer navigation
keymap('n', '<S-l>', '<cmd>bnext<CR>', {})
keymap('n', '<S-h>', '<cmd>bprevious<CR>', {})
keymap('n', '<S-n>', ':bn<CR>')
keymap('n', '<S-p>', ':bp<CR>')

-- Window navigation
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')

-- Window resizing
keymap('n', '<C-Up>', ':resize -2<CR>', {})
keymap('n', '<C-Down>', ':resize +2<CR>', {})
keymap('n', '<C-Left>', ':vertical resize -2<CR>', {})
keymap('n', '<C-Right>', ':vertical resize +2<CR>', {})


-- [[ Interactive mode ]] -- 

-- Press jk to exit insert mode (Experimental)
keymap('i', 'jk', '<ESC>')


-- [[ Visual mode ]] -- 

-- Better indentation
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Better paste
keymap('v', 'p', '"_dP')


-- [[ Visual Block mode ]] -- 

-- Move text up and down
keymap('x', '<A-j>', ":move '>+1<CR>gv-gv")
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv")


-- [[ Terminal mode ]] -- 

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
