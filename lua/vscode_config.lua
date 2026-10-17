local M = {}

local function vscode_notify(command)
  return function()
    vim.fn.VSCodeNotify(command)
  end
end

function M.setup()
  vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = 'Leader placeholder' })

  vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Up (display line aware)' })
  vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Down (display line aware)' })

  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down' })
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up' })

  vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines, keep cursor position' })
  vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center cursor' })
  vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center cursor' })
  vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next match and center cursor' })
  vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous match and center cursor' })

  vim.keymap.set('x', '<leader>p', [["_dP]], { desc = 'Paste without yanking replaced text' })
  vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to system clipboard' })
  vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = 'Yank line to system clipboard' })
  vim.keymap.set('n', '<leader>p', [["+p]], { desc = 'Paste from system clipboard' })
  vim.keymap.set('n', '<leader>P', [["+P]], { desc = 'Paste before from system clipboard' })

  vim.keymap.set({ 'i', 's' }, '<C-c>', '<Esc>', { silent = true, desc = 'Leave insert/select' })

  vim.keymap.set('n', '<leader>gs', vscode_notify('workbench.view.scm'), { desc = 'Git Status' })
  vim.keymap.set({ 'n', 'v' }, '<leader>fc', vscode_notify('editor.action.formatDocument'), { desc = '[F]ormat [C]ode' })
end

return M
