return {
  {
    -- Formatter runner with format-on-save.
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
      format_on_save = nil,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff_format' },
        rust = { 'rustfmt' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        css = { 'prettier' },
        scss = { 'prettier' },
        html = { 'prettier' },
        json = { 'jq' },
        jsonc = { 'jq' },
        mdx = { 'prettier' },
      },
    },
  },
}
