-- Initialize lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local result = vim.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }):wait()

  if result.code ~= 0 then
    error('Failed to clone lazy.nvim: ' .. (result.stderr or 'unknown error'))
  end
end
vim.opt.rtp:prepend(lazypath)

local is_vscode = vim.g.vscode ~= nil

require('lazy').setup(
  {
    spec = is_vscode and {
      {
        name = 'vscode-local-config',
        dir = vim.fn.stdpath('config'),
        lazy = false,
        cond = true,
        config = function()
          require('vscode_config').setup()
        end,
      },
    } or {
      { import = 'plugins' },
    },
    defaults = {
      cond = not is_vscode,
    },
    change_detection = { notify = false }
  }
)
