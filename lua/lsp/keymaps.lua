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

  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = '[L]SP [R]ename', buffer = bufnr })
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = '[L]SP code [A]ction', buffer = bufnr })
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = '[L]SP [S]ignature help', buffer = bufnr })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP hover', buffer = bufnr })
  vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { desc = '[L]SP [D]efinition', buffer = bufnr })
  vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, { desc = '[L]SP [D]eclaration', buffer = bufnr })
  vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, { desc = '[L]SP [I]mplementation', buffer = bufnr })
  vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, { desc = '[L]SP [T]ype definition', buffer = bufnr })
  vim.keymap.set('n', '<leader>lf', function()
    local ok, conform = pcall(require, 'conform')
    if ok then
      conform.format({ bufnr = bufnr, lsp_format = 'fallback' })
      return
    end
    vim.lsp.buf.format({ bufnr = bufnr })
  end, { desc = '[L]SP [F]ormat', buffer = bufnr })
  vim.keymap.set('n', '<leader>lh', function()
    toggle_inlay_hint(bufnr)
  end, { desc = '[L]SP toggle inlay [H]int', buffer = bufnr })

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
