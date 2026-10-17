local M = {}

local function toggle_inlay_hint(bufnr)
  local is_enabled = false
  pcall(function()
    is_enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
  end)
  pcall(vim.lsp.inlay_hint.enable, not is_enabled, { bufnr = bufnr })
end

function M.on_attach(event)
  local bufnr = event.buf

  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[N]ame', buffer = bufnr })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ctions', buffer = bufnr })
  vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, { desc = 'Signature help', buffer = bufnr })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP hover', buffer = bufnr })
  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition', buffer = bufnr })
  vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration', buffer = bufnr })
  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, { desc = '[G]oto [R]eferences', buffer = bufnr })
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, { desc = '[G]oto [I]mplementation', buffer = bufnr })
  vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, { desc = '[T]ype [D]efinition', buffer = bufnr })
  vim.keymap.set('n', '<leader>ih', function()
    toggle_inlay_hint(bufnr)
  end, { desc = 'Toggle inlay hint', buffer = bufnr })

  pcall(vim.lsp.inlay_hint.enable, true, { bufnr = bufnr })
end

function M.setup()
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspAttachKeymaps', { clear = true }),
    desc = 'LSP keymaps and buffer-local defaults',
    callback = M.on_attach,
  })
end

return M
