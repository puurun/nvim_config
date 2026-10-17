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
        preset = 'super-tab',
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            end
            return cmp.select_and_accept()
          end,
          'fallback',
        },
        ['<C-l>'] = { 'snippet_forward', 'fallback' },
        ['<C-h>'] = { 'snippet_backward', 'fallback' },
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
