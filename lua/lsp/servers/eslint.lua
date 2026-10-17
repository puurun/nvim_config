local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('eslint', utils.with_capabilities(capabilities, {
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'svelte',
    },
    settings = {
      workingDirectory = {
        mode = 'auto',
      },
      format = false,
    },
    on_attach = function(client, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, 'LspEslintFixAll', function()
        client:request_sync('workspace/executeCommand', {
          command = 'eslint.applyAllFixes',
          arguments = {
            {
              uri = vim.uri_from_bufnr(bufnr),
              version = vim.lsp.util.buf_versions[bufnr],
            },
          },
        }, nil, bufnr)
      end, {})
    end,
  }))
  vim.lsp.enable('eslint')
end

return M
