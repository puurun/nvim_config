local M = {}

function M.setup()
  -- rust-analyzer can intermittently return -32802 for pull diagnostics.
  -- Ignore only that transient error to reduce noisy logs/notifications.
  for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
    local default_handler = vim.lsp.handlers[method]
    if default_handler then
      vim.lsp.handlers[method] = function(err, result, context, config)
        -- -32802: server canceled/temporary diagnostic failure (non-actionable).
        if err ~= nil and err.code == -32802 then
          return
        end
        return default_handler(err, result, context, config)
      end
    end
  end
end

return M
