local M = {}

local function with_capabilities(capabilities, opts)
  return vim.tbl_deep_extend('force', { capabilities = capabilities }, opts or {})
end

local function root_from(markers)
  return function(bufnr)
    return vim.fs.root(bufnr, markers)
  end
end

function M.setup(capabilities)
  vim.lsp.config('rust_analyzer', with_capabilities(capabilities, {
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

  vim.lsp.config('basedpyright', with_capabilities(capabilities, {
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
    root_dir = root_from({ 'uv.lock', 'pyproject.toml', '.git' }),
  }))
  vim.lsp.enable('basedpyright')

  vim.lsp.config('ruff', with_capabilities(capabilities, {
    root_dir = root_from({ 'pyproject.toml', 'uv.lock', '.git' }),
    on_attach = function(client, _)
      client.server_capabilities.hoverProvider = false
    end,
  }))
  vim.lsp.enable('ruff')
end

return M
