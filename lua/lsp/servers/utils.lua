local M = {}

function M.with_capabilities(capabilities, opts)
  return vim.tbl_deep_extend('force', { capabilities = capabilities }, opts or {})
end

function M.root_from(markers)
  return function(bufnr)
    return vim.fs.root(bufnr, markers)
  end
end

return M
