local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('ruff', utils.with_capabilities(capabilities, {
    root_markers = {
      { 'pyproject.toml', 'uv.lock' },
      { '.git' },
    },
    on_attach = function(client, _)
      client.server_capabilities.hoverProvider = false
    end,
  }))
  vim.lsp.enable('ruff')
end

return M
