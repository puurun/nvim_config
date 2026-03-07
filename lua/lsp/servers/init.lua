local M = {}

local server_modules = {
  'lsp.servers.rust_analyzer',
  'lsp.servers.basedpyright',
  'lsp.servers.ruff',
  'lsp.servers.ts_ls',
  'lsp.servers.svelte',
  'lsp.servers.yamlls',
  'lsp.servers.taplo',
}

function M.setup(capabilities)
  local utils = require('lsp.servers.utils')

  for _, module in ipairs(server_modules) do
    require(module).setup(capabilities, utils)
  end
end

return M
