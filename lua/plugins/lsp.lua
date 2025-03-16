vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
})
vim.opt.signcolumn = 'yes'
vim.lsp.inlay_hint.enable(true)
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LspAttach',
  callback = function(event)
    vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, { desc = "[R]e[N]ame", buffer = event.buf })
    vim.keymap.set("n", '<leader>ca', vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions", buffer = event.buf })
    vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, { desc = "signature_help", buffer = event.buf })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "lsp hover", buffer = event.buf })
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition", buffer = event.buf })
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration", buffer = event.buf })
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation,
      { desc = "[G]oto [I]mplementation", buffer = event.buf })
    vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, { desc = "[T]ype [D]efinition", buffer = event.buf })
    vim.keymap.set("n", '<leader>fc', vim.lsp.buf.format, { desc = "[F]ormat [C]ode", buffer = event.buf })
    vim.keymap.set("n", '<leader>ih', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = "toggle Inlay Hint", buffer = event.buf })

    -- for handling rust_analyzer
    for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
      local default_diagnostic_handler = vim.lsp.handlers[method]
      vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
          return
        end
        return default_diagnostic_handler(err, result, context, config)
      end
    end
  end
})

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function(_)
      local lspconfig_defaults = require('lspconfig').util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lspconfig_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )
      require('lspconfig').rust_analyzer.setup({})
    end
  },
  {
    'hrsh7th/nvim-cmp',
    config = function(_, opts)
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = "lazydev", group_index = 0, } -- set group index to 0 to skip loading LuaLS completions
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
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
          ['<C-l>'] = vim.snippet.jump(1),
          ['<C-h>'] = vim.snippet.jump(-1),
        }),
      })
    end
  },
  { 'hrsh7th/cmp-nvim-lsp', opts = {} },
  {
    'williamboman/mason.nvim',
    opts = {
      PATH = "append"
    }
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    config = function(_)
      require("mason-lspconfig").setup({
        ensure_installed = { 'pyright' },
        automatic_installation = false,
        handlers = {
          -- default handlers
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
          -- custom handlers
        }
      })
    end
  },

  { "j-hui/fidget.nvim",    opts = {}, }, -- shows lsp status in right bottom


  -- FOR config editing
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {
      icons = {
        type = "ϸ ",
        parameter = "ϕ ",
        offspec = "Π ", -- hint kind not defined in official LSP spec
        unknown = "ξ ", -- hint kind is nil
      },
    },
  },
}
