local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('svelte', utils.with_capabilities(capabilities, {
    root_dir = utils.root_from({ 'svelte.config.js', 'svelte.config.cjs', 'package.json', '.git' }),
  }))
  vim.lsp.enable('svelte')
end

return M
