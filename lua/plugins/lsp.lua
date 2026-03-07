return {
  {
    -- Base LSP client configuration.
    'neovim/nvim-lspconfig',
    init = function()
      require('lsp.diagnostics').setup()
      require('lsp.keymaps').setup()
      require('lsp.rust_workaround').setup()
    end,
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      require('lsp.servers').setup(capabilities)
    end,
  },
  {
    -- LSP progress notifications UI.
    'j-hui/fidget.nvim',
    opts = {},
  },
  {
    -- Better Lua development experience for Neovim config.
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- End-of-line LSP hints display.
    'chrisgrieser/nvim-lsp-endhints',
    event = 'LspAttach',
    opts = {
      icons = {
        type = 'ϸ ',
        parameter = 'ϕ ',
        offspec = 'Π ',
        unknown = 'ξ ',
      },
    },
  },
}
