local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('rust_analyzer', utils.with_capabilities(capabilities, {
    settings = {
      ['rust-analyzer'] = {
        procMacro = {
          ignored = {
            leptos_macro = { 'server' },
          },
        },
      },
    },
  }))
  vim.lsp.enable('rust_analyzer')
end

return M
