local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('basedpyright', utils.with_capabilities(capabilities, {
    settings = {
      basedpyright = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'workspace',
          useLibraryCodeForTypes = true,
          typeCheckingMode = 'basic',
        },
      },
    },
    root_dir = utils.root_from({ 'uv.lock', 'pyproject.toml', '.git' }),
  }))
  vim.lsp.enable('basedpyright')
end

return M
