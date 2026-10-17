local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('vtsls', utils.with_capabilities(capabilities, {
    root_markers = {
      { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' },
      { 'tsconfig.json', 'jsconfig.json', 'package.json' },
      { '.git' },
    },
    settings = {
      vtsls = {
        autoUseWorkspaceTsdk = true,
      },
      typescript = {
        tsserver = {
          maxTsServerMemory = 8192,
        },
        preferences = {
          includePackageJsonAutoImports = 'auto',
        },
        inlayHints = {
          parameterNames = {
            enabled = 'literals',
            suppressWhenArgumentMatchesName = true,
          },
          parameterTypes = {
            enabled = true,
          },
          variableTypes = {
            enabled = false,
          },
          propertyDeclarationTypes = {
            enabled = true,
          },
          functionLikeReturnTypes = {
            enabled = true,
          },
          enumMemberValues = {
            enabled = true,
          },
        },
      },
      javascript = {
        inlayHints = {
          parameterNames = {
            enabled = 'literals',
            suppressWhenArgumentMatchesName = true,
          },
          parameterTypes = {
            enabled = true,
          },
          variableTypes = {
            enabled = false,
          },
          propertyDeclarationTypes = {
            enabled = true,
          },
          functionLikeReturnTypes = {
            enabled = true,
          },
          enumMemberValues = {
            enabled = true,
          },
        },
      },
    },
    on_attach = function(client, _)
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end,
  }))
  vim.lsp.enable('vtsls')
end

return M
