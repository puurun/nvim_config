local languages = {
  'c',
  'cpp',
  'css',
  'go',
  'html',
  'javascript',
  'lua',
  'python',
  'rust',
  'svelte',
  'tsx',
  'typescript',
  'vim',
  'vimdoc',
}

local function treesitter_init()
  local ok, ts = pcall(require, 'nvim-treesitter')
  if not ok then
    vim.schedule(function()
      vim.notify('nvim-treesitter is unavailable. Check plugin install/version.', vim.log.levels.WARN)
    end)
    return
  end

  -- Core highlighting is provided by Neovim; start it on matching filetypes.
  local group = vim.api.nvim_create_augroup('UserTreesitterStart', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = languages,
    callback = function(event)
      pcall(vim.treesitter.start, event.buf)
    end,
  })
end

return {
  {
    -- Syntax highlighting, textobjects, and AST-based motions.
    'nvim-treesitter/nvim-treesitter',
    build = function()
      local ok, ts = pcall(require, 'nvim-treesitter')
      if ok then
        ts.update(languages, { summary = true })
      end
    end,
    dependencies = {
      -- Extra textobject queries and motions.
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = treesitter_init,
  },
}
