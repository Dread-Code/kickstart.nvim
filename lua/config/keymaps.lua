-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Show diagnostic at cursor' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
vim.keymap.set('i', '<left>', '<cmd>echo "Use <M-h> to move!!"<CR>')
vim.keymap.set('i', '<right>', '<cmd>echo "Use <M-l> to move!!"<CR>')
vim.keymap.set('i', '<up>', '<cmd>echo "Use <M-k> to move!!"<CR>')
vim.keymap.set('i', '<down>', '<cmd>echo "Use <M-j> to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keybinds to move the current o selected line up or down
vim.keymap.set('n', '<M-S-j>', ':m .+1<CR>==', { desc = 'Move the current line down' })
vim.keymap.set('n', '<M-S-k>', ':m .-2<CR>==', { desc = 'Move the current line up' })
vim.keymap.set('i', '<M-S-j>', '<Esc>:m .+1<CR>==gi', { desc = 'Move the current line down' })
vim.keymap.set('i', '<M-S-k>', '<Esc>:m .-2<CR>==gi', { desc = 'Move the current line up' })
vim.keymap.set('v', '<M-S-j>', ":m '>+1<CR>gv=gv", { desc = 'Move the current line down' })
vim.keymap.set('v', '<M-S-k>', ":m '<-2<CR>gv=gv", { desc = 'Move the current line up' })

-- Keybinds to move the cursor in insert mode
vim.keymap.set('i', '<M-h>', '<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<M-l>', '<Right>', { noremap = true, silent = true })
vim.keymap.set('i', '<M-j>', '<Down>', { noremap = true, silent = true })
vim.keymap.set('i', '<M-k>', '<Up>', { noremap = true, silent = true })

-- vim: ts=2 sts=2 sw=2 et
