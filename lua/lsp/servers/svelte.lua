local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('svelte', utils.with_capabilities(capabilities, {
    root_markers = {
      { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock', 'deno.lock' },
      { 'svelte.config.js', 'svelte.config.cjs', 'package.json' },
      { '.git' },
    },
  }))
  vim.lsp.enable('svelte')
end

return M
