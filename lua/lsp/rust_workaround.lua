local M = {}

function M.setup()
  for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_handler = vim.lsp.handlers[method]
    if default_handler then
      vim.lsp.handlers[method] = function(err, result, context, config)
        if err ~= nil and err.code == -32802 then
          return
        end
        return default_handler(err, result, context, config)
      end
    end
  end
end

return M
