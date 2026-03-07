return {
  {
    -- Detect tab/shift width from file content.
    'tpope/vim-sleuth',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    -- Toggle comments with gc/gcc.
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    -- Auto insert matching brackets/quotes.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    -- Surround text objects with pairs (quotes, brackets, tags).
    'tpope/vim-surround',
    event = 'VeryLazy',
  },
}
