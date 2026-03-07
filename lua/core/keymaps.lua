-- Remap for space to not interfere with leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = 'Leader placeholder' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Up (display line aware)' })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Down (display line aware)' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Git related
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git Status' })

-- Taken from theprimagen
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

-- Better J, Better C-u, C-d
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines, keep cursor position' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center cursor' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center cursor' })

-- Keep search terms in the middle
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next match and center cursor' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous match and center cursor' })

-- Pastes highlighted without writing to clipboard
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without yanking replaced text' })

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank line to system clipboard' })

vim.keymap.set('n', '<leader>p', [["+p]], { desc = 'Paste from system clipboard' })
vim.keymap.set('n', '<leader>P', [["+P]], { desc = 'Paste before from system clipboard' })

-- Sometimes c-c can be different from ESC
vim.keymap.set({ 'i', 's' }, '<C-c>', function()
  vim.snippet.stop()
  return '<Esc><cmd>update<cr>'
end, { expr = true, silent = true, desc = 'Leave insert/select and save buffer' })
