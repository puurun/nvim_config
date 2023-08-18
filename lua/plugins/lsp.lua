local lsp_zero_init = function(_, opts)
  local lsp = require('lsp-zero').preset({})

  lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set("n", '<leader>rn', function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", '<leader>ca', function() vim.lsp.buf.code_action() end, opts)

    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end)

  -- (Optional) Configure lua language server for neovim
  require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

  local cmp = require('cmp')
  cmp.setup({
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete()

    }
  })
  lsp.setup()

  -- remaps for lsp_signature
  local cfg = {
    toggle_key_flip_floatwin_setting = true,
  }
  require('lsp_signature').setup(cfg)
  vim.keymap.set({ 'i' }, '<C-k>', function()
    require('lsp_signature').toggle_float_win()
  end, { silent = true, noremap = true, desc = 'toggle signature' })


  vim.keymap.set("n", '<leader>fc', function() vim.lsp.buf.format() end, {desc="[F]ormat [C]ode"})

  require('rust-tools').setup()
end

local M = {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      {
        'williamboman/mason.nvim',
        config = true,
        opts = {
          ensure_installed = {
            "rust-analyzer",
          },
        }
      },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    },
    config = lsp_zero_init
  },

  'simrat39/rust-tools.nvim',
}

return M
