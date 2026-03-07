return {
  -- Quick file marks/jumps menu.
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>fa', function() require('harpoon'):list():append() end, desc = '[F]ile [A]dd to harpoon' },
    {
      '<C-e>',
      function()
        local harpoon = require('harpoon')
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = 'Toggle harpoon menu',
    },
    { '<leader>f1', function() require('harpoon'):list():select(1) end, desc = 'Harpoon select 1' },
    { '<leader>f2', function() require('harpoon'):list():select(2) end, desc = 'Harpoon select 2' },
    { '<leader>f3', function() require('harpoon'):list():select(3) end, desc = 'Harpoon select 3' },
    { '<leader>f4', function() require('harpoon'):list():select(4) end, desc = 'Harpoon select 4' },
    { '<leader>fp', function() require('harpoon'):list():prev() end, desc = 'Harpoon previous' },
    { '<leader>fn', function() require('harpoon'):list():next() end, desc = 'Harpoon next' },
  },
  config = function()
    local harpoon = require('harpoon')
    harpoon:setup()
  end,
}
