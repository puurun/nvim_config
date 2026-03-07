local M = {}

function M.setup()
  local cmp = require('cmp')

  cmp.setup({
    sources = {
      { name = 'nvim_lsp' },
      { name = 'lazydev', group_index = 0 },
    },
    snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert }),
      ['<C-x>'] = cmp.mapping.complete(),
      ['<C-p>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item({ behavior = 'select' })
        else
          cmp.complete()
        end
      end),
      ['<C-n>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_next_item({ behavior = 'select' })
        else
          cmp.complete()
        end
      end),
      ['<C-k>'] = cmp.mapping.scroll_docs(-4),
      ['<C-j>'] = cmp.mapping.scroll_docs(4),
    }),
  })

  vim.keymap.set({ 'i', 's' }, '<C-l>', function()
    if vim.snippet.active({ direction = 1 }) then
      return '<cmd>lua vim.snippet.jump(1)<cr>'
    end
    return '<C-l>'
  end, { expr = true, silent = true })

  vim.keymap.set({ 'i', 's' }, '<C-h>', function()
    if vim.snippet.active({ direction = -1 }) then
      return '<cmd>lua vim.snippet.jump(-1)<cr>'
    end
  end, { expr = true, silent = true })
end

return M
