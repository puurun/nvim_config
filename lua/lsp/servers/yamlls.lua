local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('yamlls', utils.with_capabilities(capabilities, {
    root_markers = { '.git' },
  }))
  vim.lsp.enable('yamlls')
end

return M
