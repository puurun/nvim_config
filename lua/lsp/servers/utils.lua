local M = {}

function M.with_capabilities(capabilities, opts)
  return vim.tbl_deep_extend('force', { capabilities = capabilities }, opts or {})
end

return M
