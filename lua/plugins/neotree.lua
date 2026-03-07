return {
  -- File tree explorer sidebar.
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = 'Neotree',
  keys = {
    { '<leader>ft', '<cmd>Neotree toggle<cr>', desc = '[F]ile [T]ree toggle' },
  },
  dependencies = {
    -- Shared Lua utility functions.
    'nvim-lua/plenary.nvim',
    -- Filetype icons.
    'nvim-tree/nvim-web-devicons',
    -- UI components used by neo-tree.
    'MunifTanjim/nui.nvim',
  },
}
