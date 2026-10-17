local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('taplo', utils.with_capabilities(capabilities, {
    root_markers = {
      { '.taplo.toml', 'taplo.toml' },
      { 'pyproject.toml', 'Cargo.toml' },
      { '.git' },
    },
  }))
  vim.lsp.enable('taplo')
end

return M
