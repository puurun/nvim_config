
local undotree_init = function(_, opts)
  vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
end



local M = {
  -- A Tree that shows undos
  'mbbill/undotree',
  config = undotree_init,
}

return M
