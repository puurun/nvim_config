local lsp_zero_init = function(_, _)
  local lsp_zero = require('lsp-zero')

  lsp_zero.on_attach(function(_, _)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions

    vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, { desc = "[R]e[N]ame" })
    vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })

    vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, { desc = "signature_help" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "lsp hover" })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
    vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, { desc = "[T]ype [D]efinition" })

    vim.keymap.set("n", '<leader>fc', vim.lsp.buf.format, { desc = "[F]ormat [C]ode" })
  end)


  require("luasnip.loaders.from_vscode").lazy_load()

  local cmp = require('cmp')
  local cmp_action = require('lsp-zero').cmp_action()
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehaviorInsert }),
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
      -- luasnip
      ['<C-l>'] = cmp_action.luasnip_jump_forward(),
      ['<C-h>'] = cmp_action.luasnip_jump_backward(),
    },
    sources = {
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "nvim_lsp_signature_help" },
    }
  })


  lsp_zero.setup()

  require('mason').setup({})
  require('mason-lspconfig').setup({
    ensure_installed = {
      -- Rust
      'rust_analyzer',
      -- Python
      'pyright',
      -- C/C++
      'clangd',
      -- JS
      'tsserver',
    },
    handlers = {
      lsp_zero.default_setup,
      lua_ls = function()
        local lua_opts = lsp_zero.nvim_lua_ls()
        require('lspconfig').lua_ls.setup(lua_opts)
      end,
    }
  })


  local lsp_config = require('lspconfig')
  lsp_config.rust_analyzer.setup {}
  lsp_config.jdtls.setup {}
  lsp_config.pyright.setup {}
  lsp_config.clangd.setup {}
  lsp_config.ocamllsp.setup {}
  lsp_config.tsserver.setup {}
  lsp_config.taplo.setup {}
  lsp_config.jsonls.setup {}
  lsp_config.html.setup {}



  require('rust-tools').setup()
end

-- local nvim_cmp_init = function()
--   local cmp = require('cmp')
--   cmp.setup({
--     mapping = {
--       ['<C-Space>'] = cmp.mapping.complete()
--
--     }
--   })
-- end

-- local lspconfig_init = function()
--   vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, { desc = "[R]e[N]ame" })
--   vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
--
--   vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "signature_help" })
--   vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
--   vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
--   vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
--   vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, { desc = "[T]ype [D]efinition" })
--
--
--   vim.keymap.set("n", '<leader>fc', vim.lsp.buf.format(), { desc = "[F]ormat [C]ode" })
--   local cfg = {
--     toggle_key_flip_floatwin_setting = true,
--   }
--   require('lsp_signature').setup(cfg)
--   vim.keymap.set({ 'i' }, '<C-k>', function()
--     require('lsp_signature').toggle_float_win()
--   end, { silent = true, noremap = true, desc = 'toggle signature' })
-- end

local M = {
  -- {
  --   -- LSP Configuration & Plugins
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     -- Automatically install LSPs to stdpath for neovim
  --     {
  --       'williamboman/mason.nvim',
  --       config = true,
  --       opts = {
  --         ensure_installed = {
  --           "rust-analyzer",
  --         },
  --       }
  --     },
  --     'williamboman/mason-lspconfig.nvim',
  --
  --     -- Useful status updates for LSP
  --     -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  --
  --     -- Additional lua configuration, makes nvim stuff amazing!
  --     'folke/neodev.nvim',
  --   },
  --   config = lspconfig_init
  -- },
  --
  -- {
  --   -- Autocompletion
  --   'hrsh7th/nvim-cmp',
  --   dependencies = {
  --     -- Snippet Engine & its associated nvim-cmp source
  --     'L3MON4D3/LuaSnip',
  --     'saadparwaiz1/cmp_luasnip',
  --
  --     -- Adds LSP completion capabilities
  --     'hrsh7th/cmp-nvim-lsp',
  --
  --     -- Adds a number of user-friendly snippets
  --     'rafamadriz/friendly-snippets',
  --   },
  --
  --   config=nvim_cmp_init
  -- },

  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  --   config = function(_, opts) require 'lsp_signature'.setup(opts) end
  -- },

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      'folke/neodev.nvim',
      { 'j-hui/fidget.nvim',   tag = 'legacy', opts = {} },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      {
        'L3MON4D3/LuaSnip',
        dependencies = {
          'rafamadriz/friendly-snippets',
        },
      },

      'saadparwaiz1/cmp_luasnip',
      -- "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = lsp_zero_init
  },

  'simrat39/rust-tools.nvim',
}

return M
