local M = {
  -- A Tree that shows undos
  'mbbill/undotree',
  cmd = 'UndotreeToggle',
  keys = {
    { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = '[U]ndotree toggle' },
  },
}

return M
