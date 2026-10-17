local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('emmet_language_server', utils.with_capabilities(capabilities, {
    root_markers = {
      { 'package.json' },
      { '.git' },
    },
    filetypes = {
      'css',
      'html',
      'javascriptreact',
      'less',
      'sass',
      'scss',
      'svelte',
      'typescriptreact',
    },
  }))
  vim.lsp.enable('emmet_language_server')
end

return M
