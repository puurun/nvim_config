return {
  {
    -- Completion engine with built-in LSP capabilities helper.
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = {
      -- Snippet source for completion items.
      'rafamadriz/friendly-snippets',
    },
    opts = {
      keymap = {
        preset = 'default',
      },
      completion = {
        documentation = {
          auto_show = true,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { 'sources.default' },
  },
}
