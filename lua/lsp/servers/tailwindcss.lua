local M = {}

function M.setup(capabilities, utils)
  vim.lsp.config('tailwindcss', utils.with_capabilities(capabilities, {
    root_markers = {
      { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.ts' },
      { 'postcss.config.js', 'postcss.config.cjs', 'postcss.config.ts' },
      { 'package.json', 'pnpm-lock.yaml', 'yarn.lock', 'package-lock.json' },
      { '.git' },
    },
    filetypes = {
      'css',
      'scss',
      'sass',
      'html',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
      'svelte',
    },
  }))
  vim.lsp.enable('tailwindcss')
end

return M
