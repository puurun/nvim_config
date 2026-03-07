return {
  {
    -- Git commands inside Neovim (:Git, :Gdiff, etc).
    'tpope/vim-fugitive',
    cmd = { 'Git', 'G' },
  },
  {
    -- GitHub helpers for fugitive (:GBrowse).
    'tpope/vim-rhubarb',
    cmd = { 'GBrowse' },
  },
  {
    -- Git hunk signs and hunk actions.
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gs = require('gitsigns')
        vim.keymap.set('n', '<leader>gp', gs.prev_hunk, { buffer = bufnr, desc = '[G]it previous hunk' })
        vim.keymap.set('n', '<leader>gn', gs.next_hunk, { buffer = bufnr, desc = '[G]it next hunk' })
        vim.keymap.set('n', '<leader>gh', gs.preview_hunk, { buffer = bufnr, desc = '[G]it preview hunk' })
      end,
    },
  },
}
