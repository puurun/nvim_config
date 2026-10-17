local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('basedpyright', utils.with_capabilities(capabilities, {
    root_markers = {
      { 'uv.lock', 'pyproject.toml' },
      { '.git' },
    },
    flags = {
      debounce_text_changes = 300,
    },
    settings = {
      basedpyright = {
        locale = "en",
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'openFilesOnly',
          useLibraryCodeForTypes = true,
          typeCheckingMode = 'basic',
        },
      },
    },
  }))
  vim.lsp.enable('basedpyright')
end

return M
