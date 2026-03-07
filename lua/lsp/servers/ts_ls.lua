local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('ts_ls', utils.with_capabilities(capabilities, {
    root_dir = utils.root_from({ 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' }),
    on_attach = function(client, _)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  }))
  vim.lsp.enable('ts_ls')
end

return M
