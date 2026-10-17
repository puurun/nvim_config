local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('rust_analyzer', utils.with_capabilities(capabilities, {
    root_markers = {
      { 'cargo.toml' },
      { '.git' },
    },
    settings = {

    },
  }))
  vim.lsp.enable('rust_analyzer')
end

return M
