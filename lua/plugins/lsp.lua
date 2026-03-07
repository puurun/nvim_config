return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    },
    init = function()
      require('lsp.diagnostics').setup()
      require('lsp.keymaps').setup()
      require('lsp.rust_workaround').setup()
    end,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('lsp.servers').setup(capabilities)
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('lsp.cmp').setup()
    end,
  },
  { 'hrsh7th/cmp-nvim-lsp', opts = {} },
  {
    'williamboman/mason.nvim',
    opts = {
      PATH = 'append',
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    opts = {
      ensure_installed = { 'basedpyright', 'ruff' },
      automatic_installation = false,
    },
  },
  { 'j-hui/fidget.nvim', opts = {} },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
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
