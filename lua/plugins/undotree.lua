local M = {
  -- Visual undo history tree.
  'mbbill/undotree',
  cmd = 'UndotreeToggle',
  keys = {
    { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = '[U]ndotree toggle' },
  },
}

return M
